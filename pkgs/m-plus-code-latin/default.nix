{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "m-plus-code-latin-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mpluscodelatin/MPLUSCodeLatin%5Bwdth,wght%5D.ttf?raw=true";
      name = "MPLUSCodeLatin_wdth,wght_.ttf";
      sha256 = "c755d11b372d7e2ed1f7a10640c6ff3a473c666b4a8e0b4f809e40e7d4b4c5f5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MPLUSCodeLatin_wdth,wght_.ttf $out/share/fonts/truetype/MPLUSCodeLatin_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "M PLUS Code Latin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
