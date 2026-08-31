{ ... }:

{
  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    hinting = "slight";

    defaultFonts = {
      serif = [
        "Noto Serif"
        "Noto Serif CJK SC"
      ];
      sansSerif = [
        "Noto Sans"
        "Noto Sans CJK SC"
      ];
      monospace = [
        "JetBrainsMonoNL Nerd Font Mono"
        "Noto Sans Mono CJK SC"
      ];
      emoji = [ "Noto Emoji" ];
    };
  };

  xdg.configFile."fontconfig/fonts.conf" = {
    force = true;
    text = ''
      <?xml version="1.0"?>
      <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
      <fontconfig></fontconfig>
    '';
  };
}
