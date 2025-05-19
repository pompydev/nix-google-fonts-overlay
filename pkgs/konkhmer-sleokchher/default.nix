{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "konkhmer-sleokchher-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/konkhmersleokchher/KonkhmerSleokchher-Regular.ttf?raw=true";
      name = "KonkhmerSleokchher-Regular.ttf";
      sha256 = "16cf848e5670b1565cff77a1827347a56ee085e0b556f1f6e66de8d3ba0ef0df";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KonkhmerSleokchher-Regular.ttf $out/share/fonts/truetype/KonkhmerSleokchher-Regular.ttf
  '';

  meta = with lib; {
    description = "Konkhmer Sleokchher";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
