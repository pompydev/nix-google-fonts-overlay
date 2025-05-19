{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-jp-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifjp/NotoSerifJP%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifJP_wght_.ttf";
      sha256 = "2fd527ba12b6a44ec30d796d633360da0aeba6c5d4af1304ce12bb4dc15a7dfc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifJP_wght_.ttf $out/share/fonts/truetype/NotoSerifJP_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif JP";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
