{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-cl-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteclguides/PlaywriteCLGuides-Regular.ttf?raw=true";
      name = "PlaywriteCLGuides-Regular.ttf";
      sha256 = "8c777ffbd57588f2b21df5816b9e04ebc93ce50e189e874b5cb3230b355a7a65";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteCLGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteCLGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite CL Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
