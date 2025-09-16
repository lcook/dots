set -l --append colors red green yellow magenta cyan white
set -l index (math "$(random) % 6 + 1")

set -g random_color $colors[$index]

function fish_git_prompt
    if not command -sq git
        return 1
    end

    set -l branch (command git branch --show-current 2>/dev/null)
    test -n "$branch"
    or return

    set -l changes (command git status --porcelain 2>/dev/null | awk '{print $1}' | sort -u)

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
            case \?\?
                set -a bits '?'
        end
    end

    set -l sha (command git rev-parse --short=5 HEAD 2>/dev/null)

    echo -e "▉"(set_color -r normal)" "\ue725 (set_color -r $random_color) $branch (set_color -r normal) $sha" "
    if test -n "$bits"
        echo "$(set_color -r normal) $(string join "" $bits) "
    end
end
