{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanstc/NotoSansTC%5Bwght%5D.ttf?raw=true";
      name = "NotoSansTC_wght_.ttf";
      sha256 = "864727d210d54f2537bbe23b3a839436c3992af72de9322af5270897246bd44f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTC_wght_.ttf $out/share/fonts/truetype/NotoSansTC_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans TC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
