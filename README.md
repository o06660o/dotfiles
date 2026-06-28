## Installed Packages

- JetbrainsMono Nerd Font.
- `clash-verge-rev`.
- `fcitx5`, `fcitx5-configtool`, `fcitx5-chinese-addons`.
- `kitty`.
- `codex`.
- Determinate Nix.

## Making `fish` Default Shell

```bash
shell=$(command -v fish)
echo $shell | sudo tee -a /etc/shells
chsh -s $shell
```
