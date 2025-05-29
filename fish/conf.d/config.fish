set -g fish_greeting

set -l local_config ~/.config/fish/conf.d/config.fish.local
test -e $local_config; and source $local_config

if status is-login
    function phoon_banner
        if command -sq phoon
            phoon -l 7
            echo
        end
    end

    if set -q SSH_TTY
        echo "Welcome back, "(set_color $random_color)$USER(set_color normal)
        echo
        phoon_banner
        w
        echo
    else
        phoon_banner
    end
end

__ssh_agent_start
