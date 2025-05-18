function fish_prompt
  if set -q SSH_TTY
    echo -n "* "
  end

    echo (set_color $random_color)(hostname)(set_color normal):(prompt_pwd -D2) (fish_git_prompt) ''
end
