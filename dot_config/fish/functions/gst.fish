function gst -d "git status that fall backs to ls when out of git worktree"
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        git status
    else
        echo "Not in a git worktree, falling back to ls"
        ls
    end
end
