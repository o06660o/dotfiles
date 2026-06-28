## Packages Installed by `dnf`

- `keyd` (copr).
- `clash-verge-rev`.
- `fcitx5`, `fcitx5-configtool`, `fcitx5-chinese-addons`.
- `kitty`.
- `flatpak`.

## Packages Installed by `flatpak`

- `com.qq.QQ`.
- `com.tencent.WeChat`.

## Packages Installed Manually

- JetbrainsMono Nerd Font.
- Determinate Nix.
- `codex`.

## Making `fish` the Default Shell

```bash
shell=$(command -v fish)
echo $shell | sudo tee -a /etc/shells
chsh -s $shell
```
