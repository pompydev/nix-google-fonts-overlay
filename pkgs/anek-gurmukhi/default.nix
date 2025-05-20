{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-gurmukhi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/anekgurmukhi/AnekGurmukhi%5Bwdth,wght%5D.ttf?raw=true";
      name = "AnekGurmukhi_wdth,wght_.ttf";
      sha256 = "40d72129eb332d7c4fafd25e80a30d2ac11f45e14a1660d6f7bacbf9c800d7d5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnekGurmukhi_wdth-wght_.ttf $out/share/fonts/truetype/AnekGurmukhi_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Anek Gurmukhi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
