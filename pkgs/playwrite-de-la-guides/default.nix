{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-de-la-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritedelaguides/PlaywriteDELAGuides-Regular.ttf?raw=true";
      name = "PlaywriteDELAGuides-Regular.ttf";
      sha256 = "2a9675c5689579968baa53ec3b6f9d8846999a36d89429f96dcd2f5029234c17";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteDELAGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteDELAGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite DE LA Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
