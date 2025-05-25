{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-chorasmian-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanschorasmian/NotoSansChorasmian-Regular.ttf?raw=true";
      name = "NotoSansChorasmian-Regular.ttf";
      sha256 = "30496cc8f77c1ef3f97f3c61791a579c4aa97983e8678ffc81a341151af5756b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansChorasmian-Regular.ttf $out/share/fonts/truetype/NotoSansChorasmian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Chorasmian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
