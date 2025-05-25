{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sometype-mono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sometypemono/SometypeMono%5Bwght%5D.ttf?raw=true";
      name = "SometypeMono_wght_.ttf";
      sha256 = "4095fd328c988392fb00ab867134e69beff0fc16de66ecdd9e7e232c16f16f25";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sometypemono/SometypeMono-Italic%5Bwght%5D.ttf?raw=true";
      name = "SometypeMono-Italic_wght_.ttf";
      sha256 = "c1f25acdc7125e74e3f5bce7bda0d5053553c7a574513ecd2247ca30e5170bb3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SometypeMono_wght_.ttf $out/share/fonts/truetype/SometypeMono_wght_.ttf
     install -Dm644 SometypeMono-Italic_wght_.ttf $out/share/fonts/truetype/SometypeMono-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Sometype Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
