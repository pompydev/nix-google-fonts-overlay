{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-tz-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritetzguides/PlaywriteTZGuides-Regular.ttf?raw=true";
      name = "PlaywriteTZGuides-Regular.ttf";
      sha256 = "6f24f117c1fb0f28ea8e64694ebc49e3cc12f849caba551504be7f5a9ef9f786";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteTZGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteTZGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite TZ Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
