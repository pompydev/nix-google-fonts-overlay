{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "benne-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/benne/Benne-Regular.ttf?raw=true";
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
