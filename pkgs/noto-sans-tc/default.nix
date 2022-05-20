{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tc-${version}";
  version = "2022-05-17-205400";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/152158e65366af881b716630fefd62b8767ff3b6/ofl/notosanstc/NotoSansTC%5Bwght%5D.ttf?raw=true";
      name = "NotoSansTC_wght_.ttf";
      sha256 = "fccb6ba05e6e46e464ddd5adaa2e1ac9badcbb88c762a243f600a0b51659a4c9";
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
