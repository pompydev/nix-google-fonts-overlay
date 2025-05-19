{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "savate-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/savate/Savate%5Bwght%5D.ttf?raw=true";
      name = "Savate_wght_.ttf";
      sha256 = "b46894768402bd53cbc160ea888149c63c6d134a3e5650889e5154f49b479e80";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/savate/Savate-Italic%5Bwght%5D.ttf?raw=true";
      name = "Savate-Italic_wght_.ttf";
      sha256 = "c30e3f15cdf19846727bc5ed88eb96ed007d36b717cb867e1aa74acd0aadcc22";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Savate_wght_.ttf $out/share/fonts/truetype/Savate_wght_.ttf
     install -Dm644 Savate-Italic_wght_.ttf $out/share/fonts/truetype/Savate-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Savate";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
