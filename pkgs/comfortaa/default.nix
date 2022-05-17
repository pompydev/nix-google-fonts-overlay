{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "comfortaa-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0c01af346718560354ea183d63169c8269bc76a2/ofl/comfortaa/Comfortaa[wght].ttf?raw=true";
      name = "Comfortaa_wght_.ttf";
      sha256 = "0fc3f45dc48b614db9c39181502544b37217ecbf8bee2fb35886992bc96c5bd3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Comfortaa_wght_.ttf $out/share/fonts/truetype/Comfortaa_wght_.ttf
  '';

  meta = with lib; {
    description = "Comfortaa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
