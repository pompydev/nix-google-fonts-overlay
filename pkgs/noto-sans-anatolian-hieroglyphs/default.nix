{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-anatolian-hieroglyphs-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansanatolianhieroglyphs/NotoSansAnatolianHieroglyphs-Regular.ttf?raw=true";
      name = "NotoSansAnatolianHieroglyphs-Regular.ttf";
      sha256 = "be46e1111764b0c65e448634f7fb410a14242ccbffd66002681d8f16a98bf26d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansAnatolianHieroglyphs-Regular.ttf $out/share/fonts/truetype/NotoSansAnatolianHieroglyphs-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Anatolian Hieroglyphs";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
