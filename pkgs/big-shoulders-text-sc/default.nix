{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-text-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bigshoulderstextsc/BigShouldersTextSC%5Bwght%5D.ttf?raw=true";
      name = "BigShouldersTextSC_wght_.ttf";
      sha256 = "3f02d35b7776aca0b00a85dae9e6500cbc2c8646c802f330376d089557b6a8d4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersTextSC_wght_.ttf $out/share/fonts/truetype/BigShouldersTextSC_wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Text SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
