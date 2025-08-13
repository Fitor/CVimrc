# CVimrc
> The repository is for my .vimrc.

## Getting Started

### Operating System Compatibility

| O/S            | Status |
| :------------- | :----: |
| Linux(vim)     | ✅     |
| macOS(vim)     | ✅     |

### Prerequisites

- [Vim](https://www.vim.org) should be installed (v9.1 or more recent is fine). If not pre-installed
  (run `vim --version` to confirm), check the following instructions here:
  [Installing Vim](https://vimhelp.org/usr_90.txt.html#usr_90.txt)
- `curl` or `wget` should be installed
- `git` should be installed (recommended v2.4.11 or higher)

### Basic Installation

CVimrc is installed by running one of the following commands in your terminal. You can install this via the
command-line with either `curl`, `wget` or another similar tool.

| Method    | Command                                                                                                    |
| :-------- | :--------------------------------------------------------------------------------------------------------- |
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Fitor/CVimrc/refs/heads/master/tools/install.sh)"`  |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/Fitor/CVimrc/refs/heads/master/tools/install.sh)"`    |
| **fetch** | `sh -c "$(fetch -o - https://raw.githubusercontent.com/Fitor/CVimrc/refs/heads/master/tools/install.sh)"`  |

_Note that any previous `.vimrc` will be renamed to `.vimrc.pre`. After installation, you can move
the configuration you want to preserve into the new `.vimrc`._

## Using CVimrc

### Mappings & Commands
The `mapleader` is `;`.

#### Tab Page
| Mapping      | Description                                                           |
| ---          | ---                                                                   |
| `<leader>tn` | Open a new tab page with an empty window, after the current tab page. |
| `<leader>tc` | Close current tab page.                                               |

#### Quickfix
| Mapping      | Description                 |
| ---          | ---                         |
| `<leader>qo` | Open the quickfix window.   |
| `<leader>qc` | Close the quickfix window.  |
| `<leader>ql` | Display the last error.     |
| `<leader>qp` | Display the previous error. |
| `<leader>qn` | Display the next error.     |
| `<leader>qf` | Display the first error.    |

### Project
| Command                   | Description                                      |
| ---                       | ---                                              |
| `:CVNew`                  | Create cvimrc project in current directory.      |
| `:CVEdit local`           | Edit local cvimrc project configuration.         |
| `:CVEdit global`          | Edit glocal cvimrc configuration.                |
| `:CVEdit rg`              | Edit local ripgrep configuration.                |
| `:CVEdit cvimrc-template` | Display local cvimrc project configure template. |
| `:CVEdit rgconf-template` | Display local ripgrep configure template.        |
