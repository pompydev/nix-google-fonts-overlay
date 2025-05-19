{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibarra-real-nova-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibarrarealnova/IbarraRealNova%5Bwght%5D.ttf?raw=true";
      name = "IbarraRealNova_wght_.ttf";
      sha256 = "c627ab48daf6544099014b4c5c7faa4e3b993ef5ec77709c89dd37efd4107ddd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibarrarealnova/IbarraRealNova-Italic%5Bwght%5D.ttf?raw=true";
      name = "IbarraRealNova-Italic_wght_.ttf";
      sha256 = "2ead710644460a0433998baccda6070207ad819c027cec442489578b580e1f6e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IbarraRealNova_wght_.ttf $out/share/fonts/truetype/IbarraRealNova_wght_.ttf
     install -Dm644 IbarraRealNova-Italic_wght_.ttf $out/share/fonts/truetype/IbarraRealNova-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Ibarra Real Nova";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
