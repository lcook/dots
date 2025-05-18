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

    if test -n "$bits"
        echo -n "<"(string join "" $bits)"> "
    end

    set -l sha (command git rev-parse --short=5 HEAD 2>/dev/null)

    echo -e "<"(set_color $random_color)$branch(set_color normal)"·"$sha">"
end
