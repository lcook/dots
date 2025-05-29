function __ssh_agent_start
    if command -v ssh-agent &>/dev/null and status is-interactive
        if set -q SSH_CONNECTION
            ssh-add -l &>/dev/null
            if test $status -eq 0 -o $status -eq 1
                return
            end
        end

        set -l auth_socket ~/.ssh/agent.(hostname -s).sock
        if test -S $auth_socket
            if not set -q SSH_AUTH_SOCK
                set -gx SSH_AUTH_SOCK $auth_socket
            end
        else
            set -l agent (ssh-agent -c -a "$auth_socket" -t 28800 2>/dev/null)
            test -n "$agent"; and eval $agent &>/dev/null; or rm -f "$auth_socket"
        end
    end
end
