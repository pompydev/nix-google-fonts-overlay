{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "saira-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/saira/Saira%5Bwdth,wght%5D.ttf?raw=true";
      name = "Saira_wdth,wght_.ttf";
      sha256 = "9d050fc5a01c85f74c4257c207d50b55d1e40c37308c642f974a2c5003231dde";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/saira/Saira-Italic%5Bwdth,wght%5D.ttf?raw=true";
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
