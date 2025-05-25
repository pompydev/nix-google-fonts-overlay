{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-warang-citi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanswarangciti/NotoSansWarangCiti-Regular.ttf?raw=true";
      name = "NotoSansWarangCiti-Regular.ttf";
      sha256 = "f4c6ec5458b85e1d7d9452fb404bf0c4762e98ac7eea95aa6a7e5798cb6ffdba";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansWarangCiti-Regular.ttf $out/share/fonts/truetype/NotoSansWarangCiti-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Warang Citi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
