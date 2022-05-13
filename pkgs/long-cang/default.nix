{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "long-cang-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/20da2e7644bac5325abbc9f30848ae3162bfc974/ofl/longcang/LongCang-Regular.ttf?raw=true";
      name = "LongCang-Regular.ttf";
      sha256 = "e5bf2c3f24ef2327c6f136d8f73e2f9dfdf44896fdbeb35a9515f44777bb91bc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LongCang-Regular.ttf $out/share/fonts/truetype/LongCang-Regular.ttf
  '';

  meta = with lib; {
    description = "Long Cang";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
