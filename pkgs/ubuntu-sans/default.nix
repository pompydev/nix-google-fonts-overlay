{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ubuntu-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ufl/ubuntusans/UbuntuSans%5Bwdth,wght%5D.ttf?raw=true";
      name = "UbuntuSans_wdth,wght_.ttf";
      sha256 = "37e90bba45a2a1172d9f6078e45daebaa1b4e537943205cc1309f142a254fe40";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ufl/ubuntusans/UbuntuSans-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "UbuntuSans-Italic_wdth,wght_.ttf";
      sha256 = "603f7a4b837143b742a8df3ad3ad80164a50e4529f02e3f6aa533b78e209d3df";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 UbuntuSans_wdth-wght_.ttf $out/share/fonts/truetype/UbuntuSans_wdth-wght_.ttf
     install -Dm644 UbuntuSans-Italic_wdth-wght_.ttf $out/share/fonts/truetype/UbuntuSans-Italic_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Ubuntu Sans";
    license = licenses.ufl;
    platforms = platforms.all;
  };
}
