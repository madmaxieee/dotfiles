if status is-interactive
    flush

    # function starship_transient_prompt_func
    #     echo
    #     starship module character
    # end
    starship init fish | source
    # enable_transience

    fzf_configure_bindings --directory=\cf --git_log=\el --git_status=\cg --process=\cp --variable=\cv --history=\cr

    fish_vi_key_bindings
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block

    if [ $TERM = xterm-kitty ]
        alias ssh='TERM=xterm-256color /usr/bin/ssh'
    end
end

zoxide init fish | source

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE /opt/homebrew/opt/micromamba/bin/micromamba
set -gx MAMBA_ROOT_PREFIX /Users/madmax/micromamba
$MAMBA_EXE shell hook --shell fish --prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/madmax/Documents/scripts/google-cloud-sdk/path.fish.inc' ]
    . /Users/madmax/Documents/scripts/google-cloud-sdk/path.fish.inc
end

# pnpm
set -gx PNPM_HOME /Users/madmax/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /Users/madmax/.ghcup/bin # ghcup-env

set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include
