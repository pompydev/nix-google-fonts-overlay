{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-anatolian-hieroglyphs-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansanatolianhieroglyphs/NotoSansAnatolianHieroglyphs-Regular.ttf?raw=true";
      name = "NotoSansAnatolianHieroglyphs-Regular.ttf";
      sha256 = "bdaafffb532df2c2000166dcb4250b1c48635c41d9502e223d9d51922a692728";
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
