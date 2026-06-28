# Reference: <https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_prompt.fish>.
function fish_prompt
    set -l normal (set_color --reset)

    # Color the prompt differently when we are root.
    set -l color_cwd $fish_color_cwd
    set -l suffix "\$"
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix "#"
    end

    printf "%s%s" (set_color $color_cwd) (prompt_pwd --dir-length=0)
    printf "%s%s" $normal (fish_vcs_prompt)
    printf "%s%s" $normal $suffix
    printf " "
end
