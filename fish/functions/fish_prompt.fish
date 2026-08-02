function fish_prompt --description "Transient prompt"
    set -l last_pipestatus $pipestatus
    set -l normal (set_color --reset)

    set -l color_cwd $fish_color_cwd
    set -l suffix "> "
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix "# "
    end

    set -l prompt_cwd (set_color $color_cwd)(prompt_pwd)$normal

    if contains -- --final-rendering $argv
        echo -n -s $prompt_cwd $suffix
        return
    end

    set -l suffix_color $normal
    if test $last_pipestatus[-1] != 0
        set suffix_color (set_color $fish_color_status)
    end

    set -l color_host $fish_color_host
    if set -q SSH_TTY; and set -q fish_color_host_remote
        set color_host $fish_color_host_remote
    end

    set -l prompt_host (set_color $color_host)"@"(prompt_hostname)$normal
    set -l prompt_git (fish_vcs_prompt)
    set -l prompt_nix ""
    if set -q IN_NIX_SHELL
        set prompt_nix (set_color $fish_color_option)" [nix-shell]"$normal
    end

    echo -n -s $prompt_host " " $prompt_cwd $prompt_git $prompt_nix $suffix_color $suffix
end
