{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "edu-nsw-act-foundation-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/edunswactfoundation/EduNSWACTFoundation%5Bwght%5D.ttf?raw=true";
      name = "EduNSWACTFoundation_wght_.ttf";
      sha256 = "5a4b22cc39c04d97472bbe705b9700e864492b853b4941645da60202b796146a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EduNSWACTFoundation_wght_.ttf $out/share/fonts/truetype/EduNSWACTFoundation_wght_.ttf
  '';

  meta = with lib; {
    description = "Edu NSW ACT Foundation";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
