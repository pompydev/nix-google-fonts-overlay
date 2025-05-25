{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-at-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteat/PlaywriteAT%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteAT_wght_.ttf";
      sha256 = "878517b405acf41cb54c00091b8560d37b4d1cc599c9894aa379621d6059db54";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteat/PlaywriteAT-Italic%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteAT-Italic_wght_.ttf";
      sha256 = "0bbfd0a63b20ab1ddc6ebdd4d26e268c066336489d4d51d7b918ba3d20a73baf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteAT_wght_.ttf $out/share/fonts/truetype/PlaywriteAT_wght_.ttf
     install -Dm644 PlaywriteAT-Italic_wght_.ttf $out/share/fonts/truetype/PlaywriteAT-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite AT";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
