{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "girassol-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/girassol/Girassol-Regular.ttf?raw=true";
      name = "Girassol-Regular.ttf";
      sha256 = "84c229dea2428bf26808d985a44262fd57f47a17b1722497c9d4ec5bba94fafc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Girassol-Regular.ttf $out/share/fonts/truetype/Girassol-Regular.ttf
  '';

  meta = with lib; {
    description = "Girassol";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
