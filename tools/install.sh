#!/bin/sh
#
# This script should be run via curl:
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/Fitor/CVimrc/refs/heads/master/tools/install.sh)"
#
# or via wget:
#   sh -c "$(wget -qO- https://raw.githubusercontent.com/Fitor/CVimrc/refs/heads/master/tools/install.sh)"
# or via fetch:
#   sh -c "$(fetch -o - https://raw.githubusercontent.com/Fitor/CVimrc/refs/heads/master/tools/install.sh)"
#
# As an alternative, you can first download the install script and run it afterwards:
#   wget https://raw.githubusercontent.com/Fitor/CVimrc/refs/heads/master/tools/install.sh
#   sh install.sh
#
set -e

# Make sure important variables exist if not already defined
#
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"

vdot="$HOME"
CVIMRC="$HOME/.cvimrc"

# Default settings
REPO=${REPO:-Fitor/CVimrc}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}

VUNDLE_REMOTE="https://github.com/VundleVim/Vundle.vim.git" 

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

# The [ -t 1 ] check only works when the function is not called from
# a subshell (like in `$(...)` or `(...)`, so this hack redefines the
# function at the top level to always return false when stdout is not
# a tty.
if [ -t 1 ]; then
  is_tty() {
    true
  }
else
  is_tty() {
    false
  }
fi

# Adapted from code and information by Anton Kochkov (@XVilka)
# Source: https://gist.github.com/XVilka/8346728
supports_truecolor() {
  case "$COLORTERM" in
  truecolor|24bit) return 0 ;;
  esac

  case "$TERM" in
  iterm           |\
  tmux-truecolor  |\
  linux-truecolor |\
  xterm-truecolor |\
  screen-truecolor) return 0 ;;
  esac

  return 1
}

fmt_error() {
  printf '%sError: %s%s\n' "${FMT_BOLD}${FMT_RED}" "$*" "$FMT_RESET" >&2
}

setup_color() {
  # Only use colors if connected to a terminal
  if ! is_tty; then
    FMT_RAINBOW=""
    FMT_RED=""
    FMT_GREEN=""
    FMT_YELLOW=""
    FMT_BLUE=""
    FMT_BOLD=""
    FMT_RESET=""
    return
  fi

  if supports_truecolor; then
    FMT_RAINBOW="
      $(printf '\033[38;2;255;0;0m')
      $(printf '\033[38;2;255;97;0m')
      $(printf '\033[38;2;247;255;0m')
      $(printf '\033[38;2;0;255;30m')
      $(printf '\033[38;2;77;0;255m')
      $(printf '\033[38;2;168;0;255m')
      $(printf '\033[38;2;245;0;172m')
    "
  else
    FMT_RAINBOW="
      $(printf '\033[38;5;196m')
      $(printf '\033[38;5;202m')
      $(printf '\033[38;5;226m')
      $(printf '\033[38;5;082m')
      $(printf '\033[38;5;021m')
      $(printf '\033[38;5;093m')
      $(printf '\033[38;5;163m')
    "
  fi

  FMT_RED=$(printf '\033[31m')
  FMT_GREEN=$(printf '\033[32m')
  FMT_YELLOW=$(printf '\033[33m')
  FMT_BLUE=$(printf '\033[34m')
  FMT_BOLD=$(printf '\033[1m')
  FMT_RESET=$(printf '\033[0m')
}

setup_cvimrc() {
  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  echo "${FMT_BLUE}Cloning CVimrc...${FMT_RESET}"

  command_exists git || {
    fmt_error "git is not installed"
    exit 1
  }

  ostype=$(uname)
  if [ -z "${ostype%CYGWIN*}" ] && git --version | grep -Eq 'msysgit|windows'; then
    fmt_error "Windows/MSYS Git is not supported on Cygwin"
    fmt_error "Make sure the Cygwin git package is installed and is first on the \$PATH"
    exit 1
  fi

  # Manual clone with git config options to support git < v1.7.2
  git init --quiet "$CVIMRC" && cd "$CVIMRC" \
  && git config core.eol lf \
  && git config core.autocrlf false \
  && git config fsck.zeroPaddedFilemode ignore \
  && git config fetch.fsck.zeroPaddedFilemode ignore \
  && git config receive.fsck.zeroPaddedFilemode ignore \
  && git config cvimrc.remote origin \
  && git config cvimrc.branch "$BRANCH" \
  && git remote add origin "$REMOTE" \
  && git fetch --depth=1 origin \
  && git checkout -b "$BRANCH" "origin/$BRANCH" || {
    [ ! -d "$CVIMRC" ] || {
      cd -
      rm -rf "$CVIMRC" 2>/dev/null
    }
    fmt_error "git clone of cvimrc repo failed"
    exit 1
  }
  # Exit installation directory
  cd -

  echo
}

setup_vimrc() {
  # Keep most recent old .vimrc at .vimrc.pre, and older ones with
  # datestamp of installation that moved them aside, so we never actually
  # destroy a user's original .vimrc
  echo "${FMT_BLUE}Looking for an existing vim config...${FMT_RESET}"

  OLD_VIMRC="$vdot/.vimrc.pre"
  if [ -f "$vdot/.vimrc" ] || [ -h "$zdot/.vimrc" ]; then
    if [ -e "$OLD_VIMRC" ]; then
      OLD_OLD_VIMRC="${OLD_VIMRC}-$(date +%Y-%m-%d_%H-%M-%S)"
      if [ -e "$OLD_OLD_VIMRC" ]; then
        fmt_error "$OLD_OLD_VIMRC exists. Can't back up ${OLD_VIMRC}"
        fmt_error "re-run the installer again in a couple of seconds"
        exit 1
      fi
      mv "$OLD_VIMRC" "${OLD_OLD_VIMRC}"

      echo "${FMT_YELLOW}Found old .vimrc.pre." \
        "${FMT_GREEN}Backing up to ${OLD_OLD_VIMRC}${FMT_RESET}"
    fi
    echo "${FMT_YELLOW}Found ${vdot}/.vimrc.${FMT_RESET} ${FMT_GREEN}Backing up to ${OLD_VIMRC}${FMT_RESET}"
    mv "$vdot/.vimrc" "$OLD_VIMRC"
  fi

  echo "${FMT_GREEN}Using the CVimrc template file and adding it to $vdot/.vimrc.${FMT_RESET}"

  mv -f "$CVIMRC/templates/vimrc-template" "$vdot/.vimrc"

  echo
}

setup_vundle() {
  echo "${FMT_BLUE}Cloning Vundle...${FMT_RESET}"

  command_exists git || {
    fmt_error "git is not installed"
    exit 1
  }

  if [ -n "$vdot/.vim/bundle" ]; then
    mkdir -p "$vdot/.vim/bundle"
  fi

  git clone "$VUNDLE_REMOTE" "$vdot/.vim/bundle/Vundle.vim"
}


# shellcheck disable=SC2183  # printf string has more %s than arguments ($FMT_RAINBOW expands to multiple arguments)
print_success() {
  printf 'CVimrc is now installed!\n' $FMT_RAINBOW $FMT_GREEN $FMT_RESET
}

main() {
  setup_color

  if ! command_exists vim; then
    echo "${FMT_YELLOW}vim is not installed.${FMT_RESET} Please install vim first."
    exit 1
  fi

  echo $CVIMRC

  if [ -d "$CVIMRC" ]; then
    echo "${FMT_YELLOW}The \$CVIMRC folder already exists ($CVIMRC).${FMT_RESET}"
    echo "You'll need to remove it if you want to reinstall."
    exit 1
  fi
  
  setup_cvimrc
  setup_vimrc
  setup_vundle

  print_success
}

main "$@"
