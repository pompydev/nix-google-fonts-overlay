{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "benne-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b4de97e85d669fd689f5d811bcc8b6aadd9295f8/ofl/benne/Benne-Regular.ttf?raw=true";
      name = "Benne-Regular.ttf";
      sha256 = "681a3aadbde40f411b34bf6fb555971b1d6c1e979adf7eea5793f9bdd5ec7f3d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Benne-Regular.ttf $out/share/fonts/truetype/Benne-Regular.ttf
  '';

  meta = with lib; {
    description = "Benne";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
