function __yorha_env_start
    if test -d ~/dev/yorha
        set -gx YORHA_PROJECT_PATH ~/dev/yorha/
        set -gx YORHA_LIBEXEC_PATH $YORHA_PROJECT_PATH"libexec"
        set -x fish_user_paths $YORHA_PROJECT_PATH $fish_user_paths
    end
end
