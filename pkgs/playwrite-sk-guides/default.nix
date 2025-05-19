{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-sk-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteskguides/PlaywriteSKGuides-Regular.ttf?raw=true";
      name = "PlaywriteSKGuides-Regular.ttf";
      sha256 = "03e0297a36c50c5c8fc6ac2ec84042d29d660004601f5475187dedf5eb201c0c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteSKGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteSKGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite SK Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
