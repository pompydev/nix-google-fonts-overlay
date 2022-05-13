{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "biz-udmincho-${version}";
  version = "2022-05-11-135615";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d8896e3a19b7ea3d3b11bef2946d7ca67e6694a/ofl/bizudmincho/BIZUDMincho-Regular.ttf?raw=true";
      name = "BIZUDMincho-Regular.ttf";
      sha256 = "a8c855817e5cfcc0366926070639f1dc2752693034ea19ddfc50f9a70ffddac2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BIZUDMincho-Regular.ttf $out/share/fonts/truetype/BIZUDMincho-Regular.ttf
  '';

  meta = with lib; {
    description = "BIZ UDMincho";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
