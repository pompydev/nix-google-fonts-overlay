{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bhutuka-expanded-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bhutukaexpandedone/BhuTukaExpandedOne-Regular.ttf?raw=true";
      name = "BhuTukaExpandedOne-Regular.ttf";
      sha256 = "66b52f1013bf977571c08217fc851b9988f264b065be611880b90909fb3c274d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BhuTukaExpandedOne-Regular.ttf $out/share/fonts/truetype/BhuTukaExpandedOne-Regular.ttf
  '';

  meta = with lib; {
    description = "BhuTuka Expanded One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
