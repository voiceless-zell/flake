{ isNIXOS, ... }: {
  sound.enable = isNIXOS;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = isNIXOS;
    alsa.enable = isNIXOS;
    alsa.support32Bit = isNIXOS;
    pulse.enable = isNIXOS;
  };
}
