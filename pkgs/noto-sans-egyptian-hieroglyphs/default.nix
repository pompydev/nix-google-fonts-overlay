{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-egyptian-hieroglyphs-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansegyptianhieroglyphs/NotoSansEgyptianHieroglyphs-Regular.ttf?raw=true";
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
