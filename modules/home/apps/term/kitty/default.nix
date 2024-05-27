{
  options,
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.apps.term.kitty;
in {
  options.apps.term.kitty = with types; {
    enable = mkBoolOpt false "Enable Kitty Term";

    fonts = {
      normal = mkStringOpt "ZedMono NFM Bold" "Normal Font";
      bold = mkStringOpt "ZedMono NFM ExtraBold" "Bold Font";
      italic = mkStringOpt "ZedMono NFM Bold Italic" "Italic Font";
      bold_italic = mkStringOpt "ZedMono NFM ExtraBold Italic" "Bold Italic Font";
    };
  };

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = cfg.fonts.normal;
        size = 14;
      };

      extraConfig = ''
        bold_font ${cfg.fonts.bold}
        italic_font ${cfg.fonts.italic}
        bold_italic_font ${cfg.fonts.bold_italic}

        disable_ligatures always
      '';

      catppuccin.enable = true;

      settings = {
        window_padding_width = 12;
        background_opacity = "0.8";
      };
    };
  };
}
