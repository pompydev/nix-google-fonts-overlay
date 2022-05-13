{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kaisei-opti-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2cf929ff0bb4428b0cb43920004d1e1127706b4d/ofl/kaiseiopti/KaiseiOpti-Regular.ttf?raw=true";
      name = "KaiseiOpti-Regular.ttf";
      sha256 = "990cfb1fb00f311c8975c2c5f4778b2fe5462fd5eabf0884828a323dad3f18c0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2cf929ff0bb4428b0cb43920004d1e1127706b4d/ofl/kaiseiopti/KaiseiOpti-Medium.ttf?raw=true";
      name = "KaiseiOpti-Medium.ttf";
      sha256 = "5fb67055d4d3e60625b6ee10c93fa87e348b7d99f2bfd2632bdf4e43c96d54da";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2cf929ff0bb4428b0cb43920004d1e1127706b4d/ofl/kaiseiopti/KaiseiOpti-Bold.ttf?raw=true";
      name = "KaiseiOpti-Bold.ttf";
      sha256 = "48e0a6e35903eeaea2b9559ac62cbe83dac701b2c9355c7cff8927722c965acc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KaiseiOpti-Regular.ttf $out/share/fonts/truetype/KaiseiOpti-Regular.ttf
     install -Dm644 KaiseiOpti-Medium.ttf $out/share/fonts/truetype/KaiseiOpti-Medium.ttf
     install -Dm644 KaiseiOpti-Bold.ttf $out/share/fonts/truetype/KaiseiOpti-Bold.ttf
  '';

  meta = with lib; {
    description = "Kaisei Opti";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
