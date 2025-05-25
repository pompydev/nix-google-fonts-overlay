{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-gb-j-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritegbjguides/PlaywriteGBJGuides-Regular.ttf?raw=true";
      name = "PlaywriteGBJGuides-Regular.ttf";
      sha256 = "b7be1f39971fd700acf9ef4e5c51d9412a3fc70af9e0efbfd5286ea88ea7b351";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritegbjguides/PlaywriteGBJGuides-Italic.ttf?raw=true";
      name = "PlaywriteGBJGuides-Italic.ttf";
      sha256 = "f6741238e70ee582a1a28d97e271f1dc69fce769d12c8e4a126c4500c1e0b7b4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteGBJGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteGBJGuides-Regular.ttf
     install -Dm644 PlaywriteGBJGuides-Italic.ttf $out/share/fonts/truetype/PlaywriteGBJGuides-Italic.ttf
  '';

  meta = with lib; {
    description = "Playwrite GB J Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
