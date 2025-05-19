{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanstc/NotoSansTC%5Bwght%5D.ttf?raw=true";
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
