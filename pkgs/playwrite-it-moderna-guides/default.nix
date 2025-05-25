{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-it-moderna-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteitmodernaguides/PlaywriteITModernaGuides-Regular.ttf?raw=true";
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
