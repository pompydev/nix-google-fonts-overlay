{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "winky-rough-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/winkyrough/WinkyRough%5Bwght%5D.ttf?raw=true";
      name = "WinkyRough_wght_.ttf";
      sha256 = "5f23615b697b7a440794fb11c85ab7735fe815f600ce15c981986936bba2e152";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/winkyrough/WinkyRough-Italic%5Bwght%5D.ttf?raw=true";
      name = "WinkyRough-Italic_wght_.ttf";
      sha256 = "17941dc695d1c6d5a2eeffe28f9aed303262ddb398ff721637428ec56d760c23";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WinkyRough_wght_.ttf $out/share/fonts/truetype/WinkyRough_wght_.ttf
     install -Dm644 WinkyRough-Italic_wght_.ttf $out/share/fonts/truetype/WinkyRough-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Winky Rough";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
