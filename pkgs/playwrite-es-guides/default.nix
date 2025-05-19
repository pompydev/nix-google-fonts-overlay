{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-es-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteesguides/PlaywriteESGuides-Regular.ttf?raw=true";
      name = "PlaywriteESGuides-Regular.ttf";
      sha256 = "0db6b9df15dbe108020dbeb33324cb8cc8dbdbc6f3fb44e404fc256739b90603";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteESGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteESGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite ES Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
