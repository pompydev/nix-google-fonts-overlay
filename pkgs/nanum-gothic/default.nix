{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nanum-gothic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nanumgothic/NanumGothic-Regular.ttf?raw=true";
      name = "NanumGothic-Regular.ttf";
      sha256 = "76f45ef4a6bcff344c837c95a7dcc26e017e38b5846d5ae0cdcb5b86be2e2d31";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nanumgothic/NanumGothic-Bold.ttf?raw=true";
      name = "NanumGothic-Bold.ttf";
      sha256 = "f96298f9fb18e364d2370f4c3ce948ac67a2b61af992d7234bc15c42b033c674";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nanumgothic/NanumGothic-ExtraBold.ttf?raw=true";
      name = "NanumGothic-ExtraBold.ttf";
      sha256 = "5c4568e5295a8c52bc30e7efa1ea6d2de43556268ef42daba93540a1ece691ae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NanumGothic-Regular.ttf $out/share/fonts/truetype/NanumGothic-Regular.ttf
     install -Dm644 NanumGothic-Bold.ttf $out/share/fonts/truetype/NanumGothic-Bold.ttf
     install -Dm644 NanumGothic-ExtraBold.ttf $out/share/fonts/truetype/NanumGothic-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Nanum Gothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
