{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-de-va-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritedeva/PlaywriteDEVA%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteDEVA_wght_.ttf";
      sha256 = "065c4685e85d16299620f76e8abbf67a5e250c7641e4806566747b26a474e1cb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteDEVA_wght_.ttf $out/share/fonts/truetype/PlaywriteDEVA_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite DE VA";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
