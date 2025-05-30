{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-pt-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteptguides/PlaywritePTGuides-Regular.ttf?raw=true";
      name = "PlaywritePTGuides-Regular.ttf";
      sha256 = "3811c452331b59b792159879a792dc6c176e6f8cedf2e8c13c4d835b9b59b26f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywritePTGuides-Regular.ttf $out/share/fonts/truetype/PlaywritePTGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite PT Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
