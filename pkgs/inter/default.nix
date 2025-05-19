{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inter-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/inter/Inter%5Bopsz,wght%5D.ttf?raw=true";
      name = "Inter_opsz,wght_.ttf";
      sha256 = "29160a80ff49ddcab2c97711247e08b1fab27a484a329ce8b813d820dc559031";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/inter/Inter-Italic%5Bopsz,wght%5D.ttf?raw=true";
      name = "Inter-Italic_opsz,wght_.ttf";
      sha256 = "acd98e64795781b2058f07b18475e0ecee2a0fe2b42a49e2f9e37d0d6bf66ce6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Inter_opsz,wght_.ttf $out/share/fonts/truetype/Inter_opsz,wght_.ttf
     install -Dm644 Inter-Italic_opsz,wght_.ttf $out/share/fonts/truetype/Inter-Italic_opsz,wght_.ttf
  '';

  meta = with lib; {
    description = "Inter";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
