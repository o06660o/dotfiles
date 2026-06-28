fish_add_path --path $HOME/.local/bin

function v --wraps $EDITOR
    $EDITOR $argv
end

if status is-interactive
    set -g fish_greeting
end
