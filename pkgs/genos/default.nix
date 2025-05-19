{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "genos-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/genos/Genos%5Bwght%5D.ttf?raw=true";
      name = "Genos_wght_.ttf";
      sha256 = "88a32589d9d8615ab728977d647f5e5010dbf789050d4cf25d6607b14d49a1f1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/genos/Genos-Italic%5Bwght%5D.ttf?raw=true";
      name = "Genos-Italic_wght_.ttf";
      sha256 = "88591d5374bc8ec1d7e4e1151f0289bd00a71903a52a380379491afd730a773e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Genos_wght_.ttf $out/share/fonts/truetype/Genos_wght_.ttf
     install -Dm644 Genos-Italic_wght_.ttf $out/share/fonts/truetype/Genos-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Genos";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
