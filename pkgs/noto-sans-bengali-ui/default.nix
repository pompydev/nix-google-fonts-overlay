{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-bengali-ui-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansbengaliui/NotoSansBengaliUI%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansBengaliUI_wdth,wght_.ttf";
      sha256 = "1500fd029ade204249bc276615be983f8144e45ac75812ad5fedc1a0f735240c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBengaliUI_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansBengaliUI_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Bengali UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
