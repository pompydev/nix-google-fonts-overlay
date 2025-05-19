{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mystery-quest-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mysteryquest/MysteryQuest-Regular.ttf?raw=true";
      name = "MysteryQuest-Regular.ttf";
      sha256 = "fc3fba61be98d7de03964b41175ee5629bcc6958b251f8037ef13eabb5431eb2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MysteryQuest-Regular.ttf $out/share/fonts/truetype/MysteryQuest-Regular.ttf
  '';

  meta = with lib; {
    description = "Mystery Quest";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
