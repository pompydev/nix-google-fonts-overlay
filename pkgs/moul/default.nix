{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "moul-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/moul/Moul-Regular.ttf?raw=true";
      name = "Moul-Regular.ttf";
      sha256 = "c0445e86767edf1bfb08a6fe65bd38f350b588c641af7e2e88a59d72ccecd9c3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Moul-Regular.ttf $out/share/fonts/truetype/Moul-Regular.ttf
  '';

  meta = with lib; {
    description = "Moul";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
