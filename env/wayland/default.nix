{
  pkgs,
  inputs,
  ...
}: {
  imports = [./fonts.nix];

  # environment.etc."greetd/environments".text = ''
  #   Hyprland
  # '';

  services = {
    #   greetd = {
    #     enable = true;
    #     settings = rec {
    #       initial_session = {
    #         command = "Hyprland";
    #         user = "zack";
    #       };
    #       default_session = initial_session;
    #     };
    #   };
    xserver.displayManager.gdm = {
      enable = true;
    };
    xserver.desktopManager.gnome.enable = true;
  };

  environment = {
    variables = {
      NIXOS_OZONE_WL = "1";
      __GL_GSYNC_ALLOWED = "0";
      __GL_VRR_ALLOWED = "0";
      _JAVA_AWT_WM_NONEREPARENTING = "1";
      SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
      DISABLE_QT5_COMPAT = "0";
      GDK_BACKEND = "wayland,x11";
      ANKI_WAYLAND = "1";
      DIRENV_LOG_FORMAT = "";
      WLR_DRM_NO_ATOMIC = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      DISABLE_QT_COMPAT = "0";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      MOZ_ENABLE_WAYLAND = "1";
      WLR_BACKEND = "vulkan";
      WLR_RENDERER = "vulkan";
      XDG_SESSION_TYPE = "wayland";
      SDL_VIDEODRIVER = "wayland";
      XDG_CACHE_HOME = "/home/zack/.cache";
      CLUTTER_BACKEND = "wayland";
    };
    loginShellInit = ''
      dbus-update-activation-environment --systemd DISPLAY
      eval $(gnome-keyring-daemon --start --components=ssh,secrets)
      eval $(ssh-agent)
    '';
  };

  hardware.pulseaudio.support32Bit = true;

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    wlr.enable = true;
    extraPortals = [
      # pkgs.xdg-desktop-portal-gtk
      # pkgs.xdg-desktop-portal-hyprland
    ];
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };
}
