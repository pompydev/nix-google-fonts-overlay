{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-syriac-eastern-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanssyriaceastern/NotoSansSyriacEastern%5Bwght%5D.ttf?raw=true";
      name = "NotoSansSyriacEastern_wght_.ttf";
      sha256 = "5f562f4ed8a00bcdf57a46726d15111e6b97bd06bb554a5e368a084c2116f5e4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSyriacEastern_wght_.ttf $out/share/fonts/truetype/NotoSansSyriacEastern_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Syriac Eastern";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
