{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "merriweather-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/merriweather/Merriweather%5Bopsz,wdth,wght%5D.ttf?raw=true";
      name = "Merriweather_opsz,wdth,wght_.ttf";
      sha256 = "d0ed0e359e396af7ad05e73dffd11a3a4c326ea0d0283c56bd9361cb2cc86a96";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/merriweather/Merriweather-Italic%5Bopsz,wdth,wght%5D.ttf?raw=true";
      name = "Merriweather-Italic_opsz,wdth,wght_.ttf";
      sha256 = "f68a8f4989258679e4fbaf50aa42400132b5373c2d9d2514ba82ef6e85947a0b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Merriweather_opsz-wdth-wght_.ttf $out/share/fonts/truetype/Merriweather_opsz-wdth-wght_.ttf
     install -Dm644 Merriweather-Italic_opsz-wdth-wght_.ttf $out/share/fonts/truetype/Merriweather-Italic_opsz-wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Merriweather";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
