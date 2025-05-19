{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-is-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteisguides/PlaywriteISGuides-Regular.ttf?raw=true";
      name = "PlaywriteISGuides-Regular.ttf";
      sha256 = "83911f220f0ced80a589f22e03c405d9dc05f21cc257ea88bfc0fc7b5e2c4d8b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteISGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteISGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite IS Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
