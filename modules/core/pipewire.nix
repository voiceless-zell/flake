{ isNIXOS, ... }: {
  hardware.pulseaudio.enable = isNIXOS;
  # services.pipewire = {
  #  enable = isNIXOS;
  #  alsa.enable = isNIXOS;
  #  alsa.support32Bit = isNIXOS;
  #  pulse.enable = isNIXOS;
  #};
}
