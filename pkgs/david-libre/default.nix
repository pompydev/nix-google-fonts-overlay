{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "david-libre-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2df67f4d580a12cdba3f4a4711b00c31e9215097/ofl/davidlibre/DavidLibre-Regular.ttf?raw=true";
      name = "DavidLibre-Regular.ttf";
      sha256 = "b28ae0fde84129694df5cafa014b747d129685248f0858068c624bf956e7c53b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2df67f4d580a12cdba3f4a4711b00c31e9215097/ofl/davidlibre/DavidLibre-Medium.ttf?raw=true";
      name = "DavidLibre-Medium.ttf";
      sha256 = "c8bab4cc918e281ac2cb65e70acbad07f98beab8bd592fe34091050a710d03c3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2df67f4d580a12cdba3f4a4711b00c31e9215097/ofl/davidlibre/DavidLibre-Bold.ttf?raw=true";
      name = "DavidLibre-Bold.ttf";
      sha256 = "df289445a121f2c8012063b006ee214fc49cdc8a5f4961c24c449d2007513017";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DavidLibre-Regular.ttf $out/share/fonts/truetype/DavidLibre-Regular.ttf
     install -Dm644 DavidLibre-Medium.ttf $out/share/fonts/truetype/DavidLibre-Medium.ttf
     install -Dm644 DavidLibre-Bold.ttf $out/share/fonts/truetype/DavidLibre-Bold.ttf
  '';

  meta = with lib; {
    description = "David Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
