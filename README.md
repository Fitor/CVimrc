# CVimrc
> The repository is for my .vimrc.

## Getting Started

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
