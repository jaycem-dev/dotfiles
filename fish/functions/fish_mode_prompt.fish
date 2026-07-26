function fish_mode_prompt
    if contains -- --final-rendering $argv
        return
    end
    fish_default_mode_prompt
end
