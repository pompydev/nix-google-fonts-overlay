{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "abril-fatface-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/abrilfatface/AbrilFatface-Regular.ttf?raw=true";
      name = "AbrilFatface-Regular.ttf";
      sha256 = "5971d4a3758a922a9fedc7f6fb825a96341a2e718c45a4b2c9a6b417c8c4dbe9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AbrilFatface-Regular.ttf $out/share/fonts/truetype/AbrilFatface-Regular.ttf
  '';

  meta = with lib; {
    description = "Abril Fatface";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
