{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-it-moderna-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteitmodernaguides/PlaywriteITModernaGuides-Regular.ttf?raw=true";
      name = "PlaywriteITModernaGuides-Regular.ttf";
      sha256 = "af047b6ae1db6bd7fcd637cab94336172b059166af1d7e175811ce59dc512cbe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteITModernaGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteITModernaGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite IT Moderna Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
