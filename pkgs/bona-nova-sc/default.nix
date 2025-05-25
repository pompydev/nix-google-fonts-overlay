{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bona-nova-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bonanovasc/BonaNovaSC-Regular.ttf?raw=true";
      name = "BonaNovaSC-Regular.ttf";
      sha256 = "e4d155cdf1917f42e4d9073ab8856bb4b58984a3849c7753f27fe3837da832f8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bonanovasc/BonaNovaSC-Italic.ttf?raw=true";
      name = "BonaNovaSC-Italic.ttf";
      sha256 = "9b329433c3a9a2e4c89c1197b9cfffc1803c3cc6e0b95d6481d29e585fe3a34c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bonanovasc/BonaNovaSC-Bold.ttf?raw=true";
      name = "BonaNovaSC-Bold.ttf";
      sha256 = "bf71dbb726e75b34b3f09aaf799107937af5c0f401f3fc6bca80cbbed55fe36c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BonaNovaSC-Regular.ttf $out/share/fonts/truetype/BonaNovaSC-Regular.ttf
     install -Dm644 BonaNovaSC-Italic.ttf $out/share/fonts/truetype/BonaNovaSC-Italic.ttf
     install -Dm644 BonaNovaSC-Bold.ttf $out/share/fonts/truetype/BonaNovaSC-Bold.ttf
  '';

  meta = with lib; {
    description = "Bona Nova SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
