{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-turkic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansoldturkic/NotoSansOldTurkic-Regular.ttf?raw=true";
      name = "NotoSansOldTurkic-Regular.ttf";
      sha256 = "b8e3f206a9fdaea960a988bb1ed3275391eb534d127859611dca87f2204da4a7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldTurkic-Regular.ttf $out/share/fonts/truetype/NotoSansOldTurkic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old Turkic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
