{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-es-deco-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteesdecoguides/PlaywriteESDecoGuides-Regular.ttf?raw=true";
      name = "PlaywriteESDecoGuides-Regular.ttf";
      sha256 = "2ca6b8ee59c3b5568d4c5e526963684550ca980f9b37b948176d56d550630bf2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteESDecoGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteESDecoGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite ES Deco Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
