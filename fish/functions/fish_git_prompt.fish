function fish_git_prompt
    command -sq git || return 1

    set -l git_status (command git status --porcelain=1 --branch 2>/dev/null)

    test -n "$git_status" || return 1

    set -l branch (string match -rg '^## (\w+)' $git_status)
    set -l changes (string trim $git_status | string match -r '^[AMDR\?]' | sort -u)

    set -l bits
    for p in $changes
        switch $p
            case A
                set -a bits '+'
            case D
                set -a bits -
            case M
                set -a bits '!'
            case R
                set -a bits '>'
            case \?
                set -a bits '?'
        end
    end

    set -l sha (command git rev-parse --short=5 HEAD 2>/dev/null)

    echo -e \ue725 (set_color $random_color)$branch(set_color normal):$sha
    test -n "$bits" && echo (set_color $random_color)(string join "" $bits)(set_color normal)
end
