{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-egyptian-hieroglyphs-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansegyptianhieroglyphs/NotoSansEgyptianHieroglyphs-Regular.ttf?raw=true";
      name = "NotoSansEgyptianHieroglyphs-Regular.ttf";
      sha256 = "ad50e535500acc88b9582c648cc84ca9a4679c1810a426aa85b7ba8bada8af15";
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
