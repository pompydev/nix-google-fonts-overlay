{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-egyptian-hieroglyphs-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansegyptianhieroglyphs/NotoSansEgyptianHieroglyphs-Regular.ttf?raw=true";
      name = "NotoSansEgyptianHieroglyphs-Regular.ttf";
      sha256 = "b792accc6207ca9caa59fc67f53926b6985a99d255dd432d7c68b68a6dfd62f8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansEgyptianHieroglyphs-Regular.ttf $out/share/fonts/truetype/NotoSansEgyptianHieroglyphs-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Egyptian Hieroglyphs";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
