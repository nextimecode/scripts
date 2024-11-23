# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Carrega o nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # Carrega o bash_completion para nvm

# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

export PATH="$PATH:$HOME/.npm-global/bin"
export PATH="$PATH:$(npm bin -g)"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Carrega zsh-syntax-highlighting
source /Users/pedroduarte/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Configuração do PATH
export PATH="/opt/homebrew/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:/Applications/Docker.app/Contents/Resources/bin:/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# Configuração adicional para OpenSSL
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib -L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include -I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix zstd)/lib/

# Corrige conflitos de compilação
export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC
export optflags="-Wno-error=implicit-function-declaration"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Carrega o Zinit (plugin manager)
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  node          # Node.js section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# Add Docker Desktop for Mac (docker)
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix zstd)/lib/

# Hook para garantir a versão correta ao mudar de diretório
autoload -U add-zsh-hook
add-zsh-hook chpwd use_node_version_for_project

export STORE_PATH=$(pnpm store path --silent)

export NPM_TOKEN="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"

source /Users/pedroduarte/dev/scripts/backups/alias.sh

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

~/dev/scripts/libs/bootstrap.sh

PATH=~/.console-ninja/.bin:$PATH
