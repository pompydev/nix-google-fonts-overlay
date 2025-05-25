{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-us-trad-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteustradguides/PlaywriteUSTradGuides-Regular.ttf?raw=true";
      name = "PlaywriteUSTradGuides-Regular.ttf";
      sha256 = "1eac92a6a9349a33f9f6829ffc2c3c758ec91536e711427988a74099db395c82";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteUSTradGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteUSTradGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite US Trad Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
