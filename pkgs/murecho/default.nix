{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "murecho-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/15010ad77ab4506015ff78788f3991db34a94ded/ofl/murecho/Murecho%5Bwght%5D.ttf?raw=true";
      name = "Murecho_wght_.ttf";
      sha256 = "3a273c2f11e0164f829bc15c0689e587fe34d1493ff167d5afff8fe71a29e667";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Murecho_wght_.ttf $out/share/fonts/truetype/Murecho_wght_.ttf
  '';

  meta = with lib; {
    description = "Murecho";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
