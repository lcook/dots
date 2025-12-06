set -l --append colors red green yellow blue magenta cyan
set -l index (math "$(random) % 6 + 1")

set -g random_color $colors[$index]

function fish_prompt
    if test -f /run/.containerenv
        echo -n "⬢ "
    end

    if set -q SSH_TTY
        echo -n "* "
    end

    echo -e (set_color $random_color)$USER(set_color normal):(prompt_pwd -D2) (fish_git_prompt) "% "
end
