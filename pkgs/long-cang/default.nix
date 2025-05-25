{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "long-cang-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/longcang/LongCang-Regular.ttf?raw=true";
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
