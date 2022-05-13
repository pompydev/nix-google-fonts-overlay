{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "biz-udpgothic-${version}";
  version = "2022-05-11-135659";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/01ac47e0b1cddbc298334c69a5dfafb0205ffa28/ofl/bizudpgothic/BIZUDPGothic-Regular.ttf?raw=true";
      name = "BIZUDPGothic-Regular.ttf";
      sha256 = "a8e73ddd5a208b2bef62c2846a87c173cd7aae101725044d9e723d361093d7db";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/01ac47e0b1cddbc298334c69a5dfafb0205ffa28/ofl/bizudpgothic/BIZUDPGothic-Bold.ttf?raw=true";
      name = "BIZUDPGothic-Bold.ttf";
      sha256 = "91e6e67841a04533e893885de3643333a803e35242d8b60e343107f506ac5bfa";
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
