if status is-interactive
    flush

    starship init fish | source

    atuin init fish --disable-up-arrow | source
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search

    set -gx _ZO_DATA_DIR "$HOME/.local/share"
    set -gx _ZO_RESOLVE_SYMLINKS 1
    set -gx _ZO_EXCLUDE_DIRS "/nix/store/*"
    zoxide init fish | source

    if [ $TERM = xterm-kitty ]
        alias ssh='TERM=xterm-256color /usr/bin/ssh'
    end

    fish_vi_key_bindings
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block

    # if not in tmux, start a new session
    if [ -z "$TMUX" ]
        # tmux new-session -A -s main
        tmux new-session -A -s main >/dev/null 2>&1
    end
end

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE /run/current-system/sw/bin/micromamba
set -gx MAMBA_ROOT_PREFIX /Users/madmax/micromamba
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

# pnpm
set -gx PNPM_HOME /Users/madmax/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
# set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include

set -gx DYLD_LIBRARY_PATH (find /opt/homebrew/Cellar/imagemagick/ -maxdepth 2 -type d -name lib)

if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end
