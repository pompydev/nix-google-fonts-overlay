{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kanchenjunga-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kanchenjunga/Kanchenjunga-Regular.ttf?raw=true";
      name = "Kanchenjunga-Regular.ttf";
      sha256 = "45609f8cc90d4733d3d1665346d359afc1a659def340d0f369121af034322ef9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kanchenjunga/Kanchenjunga-Medium.ttf?raw=true";
      name = "Kanchenjunga-Medium.ttf";
      sha256 = "cba5d8031cdbfd8d0eee90f11453a39f6f72cd6a9062636bedf4ebf7b72a27d5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kanchenjunga/Kanchenjunga-SemiBold.ttf?raw=true";
      name = "Kanchenjunga-SemiBold.ttf";
      sha256 = "126e137cb641813aa6f0a3688ea5d0c3b5b0a2121cd64237d39e0b3bafae9895";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kanchenjunga/Kanchenjunga-Bold.ttf?raw=true";
      name = "Kanchenjunga-Bold.ttf";
      sha256 = "67a9a29cd49a17832a5eee8d2747fb9a66ee32e49dc52f5dd43887ff24eb0935";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kanchenjunga-Regular.ttf $out/share/fonts/truetype/Kanchenjunga-Regular.ttf
     install -Dm644 Kanchenjunga-Medium.ttf $out/share/fonts/truetype/Kanchenjunga-Medium.ttf
     install -Dm644 Kanchenjunga-SemiBold.ttf $out/share/fonts/truetype/Kanchenjunga-SemiBold.ttf
     install -Dm644 Kanchenjunga-Bold.ttf $out/share/fonts/truetype/Kanchenjunga-Bold.ttf
  '';

  meta = with lib; {
    description = "Kanchenjunga";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
