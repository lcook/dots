function fish_prompt
    if set -q SSH_TTY
        echo -n "* "
    end

    echo -e (set_color $random_color)\u2589(set_color -r $random_color) $(hostname) (set_color normal) $(prompt_pwd -D2) (fish_git_prompt)(set_color normal) \u1409" "
end
