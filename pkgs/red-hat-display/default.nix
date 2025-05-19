{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "red-hat-display-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/redhatdisplay/RedHatDisplay%5Bwght%5D.ttf?raw=true";
      name = "RedHatDisplay_wght_.ttf";
      sha256 = "46c9d4c4a2415e7e72020b318f5cda2bcbc9018d78b1a67e480a76d8d6e4b379";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/redhatdisplay/RedHatDisplay-Italic%5Bwght%5D.ttf?raw=true";
      name = "RedHatDisplay-Italic_wght_.ttf";
      sha256 = "6f1e62869decc48f589b022b88b486b1f3f55792618e79f986a6b656c9378a59";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RedHatDisplay_wght_.ttf $out/share/fonts/truetype/RedHatDisplay_wght_.ttf
     install -Dm644 RedHatDisplay-Italic_wght_.ttf $out/share/fonts/truetype/RedHatDisplay-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Red Hat Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
