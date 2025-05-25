{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kay-pho-du-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kayphodu/KayPhoDu-Regular.ttf?raw=true";
      name = "KayPhoDu-Regular.ttf";
      sha256 = "aa54e0cd1c01e7e8ac9887eaf3dac3e7ef2df9c2b58049ef8a0ab8b1a76cbe1e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kayphodu/KayPhoDu-Medium.ttf?raw=true";
      name = "KayPhoDu-Medium.ttf";
      sha256 = "4bb552ffcfe2bf7495188616375af8ead67b05536d43fc35b915aa6ce9eb619b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kayphodu/KayPhoDu-SemiBold.ttf?raw=true";
      name = "KayPhoDu-SemiBold.ttf";
      sha256 = "07f14ba8c7b3e40bb879da8908aaff4546435edd61e2924f6eae10b54f8e63d4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kayphodu/KayPhoDu-Bold.ttf?raw=true";
      name = "KayPhoDu-Bold.ttf";
      sha256 = "8d89876b4e2adeb97b9d312ff448e3a66dce7c52c7c21d564159a292ff60787e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KayPhoDu-Regular.ttf $out/share/fonts/truetype/KayPhoDu-Regular.ttf
     install -Dm644 KayPhoDu-Medium.ttf $out/share/fonts/truetype/KayPhoDu-Medium.ttf
     install -Dm644 KayPhoDu-SemiBold.ttf $out/share/fonts/truetype/KayPhoDu-SemiBold.ttf
     install -Dm644 KayPhoDu-Bold.ttf $out/share/fonts/truetype/KayPhoDu-Bold.ttf
  '';

  meta = with lib; {
    description = "Kay Pho Du";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
