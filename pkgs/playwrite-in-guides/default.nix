{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-in-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteinguides/PlaywriteINGuides-Regular.ttf?raw=true";
      name = "PlaywriteINGuides-Regular.ttf";
      sha256 = "803a92a563111b4e4e97098b85b0c17d8098da9636ecee072a356104aa4884e8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteINGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteINGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite IN Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
