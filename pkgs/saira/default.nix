{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "saira-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3cfea32a77637ada0e209f10d9f91e7ff9d2a32f/ofl/saira/Saira%5Bwdth,wght%5D.ttf?raw=true";
      name = "Saira_wdth,wght_.ttf";
      sha256 = "9d050fc5a01c85f74c4257c207d50b55d1e40c37308c642f974a2c5003231dde";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3cfea32a77637ada0e209f10d9f91e7ff9d2a32f/ofl/saira/Saira-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "Saira-Italic_wdth,wght_.ttf";
      sha256 = "965972c2543b72948aedb55fae36e23175661d0f9d2d8d7f14a1009e466912f8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Saira_wdth,wght_.ttf $out/share/fonts/truetype/Saira_wdth,wght_.ttf
     install -Dm644 Saira-Italic_wdth,wght_.ttf $out/share/fonts/truetype/Saira-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Saira";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
