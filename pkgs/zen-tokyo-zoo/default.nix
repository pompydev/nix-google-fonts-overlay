{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zen-tokyo-zoo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zentokyozoo/ZenTokyoZoo-Regular.ttf?raw=true";
      name = "ZenTokyoZoo-Regular.ttf";
      sha256 = "9dd9dc1a5eba800aca9b0bf4671bda880b7caa6d19174c82776256f6732d604a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZenTokyoZoo-Regular.ttf $out/share/fonts/truetype/ZenTokyoZoo-Regular.ttf
  '';

  meta = with lib; {
    description = "Zen Tokyo Zoo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
