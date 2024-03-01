{
  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}