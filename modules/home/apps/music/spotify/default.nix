{
  options,
  config,
  lib,
  inputs,
  system,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.apps.music.spotify;
  spicePkgs = inputs.spicetify-nix.packages.${system}.default;
in {
  options.apps.music.spotify = with types; {
    enable = mkBoolOpt false "Enable Spotify";
  };

  config = mkIf cfg.enable {
    programs.spicetify = {
      enable = true;
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";

      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle # shuffle+ (special characters are sanitized out of ext names)
        hidePodcasts
      ];
    };
  };
}