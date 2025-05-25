{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inknut-antiqua-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/inknutantiqua/InknutAntiqua-Light.ttf?raw=true";
      name = "InknutAntiqua-Light.ttf";
      sha256 = "6961c4e6b3dfffd2408417d5b58994882806ae959e005309a0096869babd80dc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/inknutantiqua/InknutAntiqua-Regular.ttf?raw=true";
      name = "InknutAntiqua-Regular.ttf";
      sha256 = "d46c7420b1e5fedc2086c8ce89275a6ed13c6778829c0617f56df8c3bddd686f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/inknutantiqua/InknutAntiqua-Medium.ttf?raw=true";
      name = "InknutAntiqua-Medium.ttf";
      sha256 = "2ec563cf7dfc16e944ff6fb3411dd7fc49de13515d3993587243f02e76e4bf98";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/inknutantiqua/InknutAntiqua-SemiBold.ttf?raw=true";
      name = "InknutAntiqua-SemiBold.ttf";
      sha256 = "f4d31ad01f24ae26b30c8610f5b3e1ab9383876f1ef98cc0a4118024928456f4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/inknutantiqua/InknutAntiqua-Bold.ttf?raw=true";
      name = "InknutAntiqua-Bold.ttf";
      sha256 = "222a233da522553541938fa7780d3bcc008af009679797658885f0052ffb76ef";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/inknutantiqua/InknutAntiqua-ExtraBold.ttf?raw=true";
      name = "InknutAntiqua-ExtraBold.ttf";
      sha256 = "89f62cfa8e72f8ec9acc5a0aae088ab4b04fed9c3dbaaad0d2fdb6563a41cba4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/inknutantiqua/InknutAntiqua-Black.ttf?raw=true";
      name = "InknutAntiqua-Black.ttf";
      sha256 = "279de2d9b3f21796a2a367cc55d8654eee9534a4f329d5d442294d82a333c361";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 InknutAntiqua-Light.ttf $out/share/fonts/truetype/InknutAntiqua-Light.ttf
     install -Dm644 InknutAntiqua-Regular.ttf $out/share/fonts/truetype/InknutAntiqua-Regular.ttf
     install -Dm644 InknutAntiqua-Medium.ttf $out/share/fonts/truetype/InknutAntiqua-Medium.ttf
     install -Dm644 InknutAntiqua-SemiBold.ttf $out/share/fonts/truetype/InknutAntiqua-SemiBold.ttf
     install -Dm644 InknutAntiqua-Bold.ttf $out/share/fonts/truetype/InknutAntiqua-Bold.ttf
     install -Dm644 InknutAntiqua-ExtraBold.ttf $out/share/fonts/truetype/InknutAntiqua-ExtraBold.ttf
     install -Dm644 InknutAntiqua-Black.ttf $out/share/fonts/truetype/InknutAntiqua-Black.ttf
  '';

  meta = with lib; {
    description = "Inknut Antiqua";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
