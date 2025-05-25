{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bhutuka-expanded-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bhutukaexpandedone/BhuTukaExpandedOne-Regular.ttf?raw=true";
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
