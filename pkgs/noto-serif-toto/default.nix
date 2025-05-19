{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-toto-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoseriftoto/NotoSerifToto%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifToto_wght_.ttf";
      sha256 = "776c27354b06462d15963a8c11b35c90a777638ca2659be0667766570ec5fd1c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifToto_wght_.ttf $out/share/fonts/truetype/NotoSerifToto_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Toto";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
