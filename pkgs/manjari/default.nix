{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "manjari-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/59eed8e65faaf2b78b482443db7fe167ddab8ead/ofl/manjari/Manjari-Thin.ttf?raw=true";
      name = "Manjari-Thin.ttf";
      sha256 = "0eab2fd482b2b0e6cd469c53d09513a2303ff91c86dc8c1ba42acfc73242bd72";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/59eed8e65faaf2b78b482443db7fe167ddab8ead/ofl/manjari/Manjari-Regular.ttf?raw=true";
      name = "Manjari-Regular.ttf";
      sha256 = "16460924696bfea2a2f71b4201d8786867c6413b548ecbd22bc6bfe55be90f95";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/59eed8e65faaf2b78b482443db7fe167ddab8ead/ofl/manjari/Manjari-Bold.ttf?raw=true";
      name = "Manjari-Bold.ttf";
      sha256 = "f19fef695b28e5448ae87451dfbab426676cadf4b59340558a157c0071b69d26";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Manjari-Thin.ttf $out/share/fonts/truetype/Manjari-Thin.ttf
     install -Dm644 Manjari-Regular.ttf $out/share/fonts/truetype/Manjari-Regular.ttf
     install -Dm644 Manjari-Bold.ttf $out/share/fonts/truetype/Manjari-Bold.ttf
  '';

  meta = with lib; {
    description = "Manjari";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
