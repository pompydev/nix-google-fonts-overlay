{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "coiny-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/coiny/Coiny-Regular.ttf?raw=true";
      name = "Coiny-Regular.ttf";
      sha256 = "ef02d723a54abe4819bea54ea8b2ecf72d77d258010bb336cd4862a37705eac7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Coiny-Regular.ttf $out/share/fonts/truetype/Coiny-Regular.ttf
  '';

  meta = with lib; {
    description = "Coiny";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
