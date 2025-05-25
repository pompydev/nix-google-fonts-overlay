{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "martian-mono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/martianmono/MartianMono%5Bwdth,wght%5D.ttf?raw=true";
      name = "MartianMono_wdth,wght_.ttf";
      sha256 = "c3467843ec1c2574b05fbcfd7147c7bfbcf63ddca8fc2bcb9d117f1bfb1b22e7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MartianMono_wdth-wght_.ttf $out/share/fonts/truetype/MartianMono_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Martian Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
