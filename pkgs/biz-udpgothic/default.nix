{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "biz-udpgothic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bizudpgothic/BIZUDPGothic-Regular.ttf?raw=true";
      name = "BIZUDPGothic-Regular.ttf";
      sha256 = "258d7156c165f2ff774b6efee637c22c3b950de0d8a10e501137061bc8085d01";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bizudpgothic/BIZUDPGothic-Bold.ttf?raw=true";
      name = "BIZUDPGothic-Bold.ttf";
      sha256 = "30eba52fc837e8b62c97d4b82e6706583149fb7294e3712dd71a655eaea80a90";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BIZUDPGothic-Regular.ttf $out/share/fonts/truetype/BIZUDPGothic-Regular.ttf
     install -Dm644 BIZUDPGothic-Bold.ttf $out/share/fonts/truetype/BIZUDPGothic-Bold.ttf
  '';

  meta = with lib; {
    description = "BIZ UDPGothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
