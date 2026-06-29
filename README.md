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

## Common Problems

### Making `fish` the Default Shell

```bash
shell=$(command -v fish)
echo $shell | sudo tee -a /etc/shells
chsh -s $shell
```

### Fix `com.tencent.WeChat`

```bash
# Reference: <https://forums.debiancn.org/t/topic/6635>.
flatpak override --user --reset com.tencent.WeChat
flatpak override --user \
  --env=GTK_IM_MODULE=fcitx \
  --env=QT_IM_MODULE=fcitx \
  --env=XMODIFIERS=@im=fcitx \
  --env=QT_QPA_PLATFORM=xcb \
  --filesystem=home \
  com.tencent.WeChat
```
