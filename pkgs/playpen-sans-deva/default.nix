{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playpen-sans-deva-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playpensansdeva/PlaypenSansDeva%5Bwght%5D.ttf?raw=true";
      name = "PlaypenSansDeva_wght_.ttf";
      sha256 = "741156a0ea70b12b150625cd715c34f0a921db5f7dd2bceb37043e59764ae3ea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaypenSansDeva_wght_.ttf $out/share/fonts/truetype/PlaypenSansDeva_wght_.ttf
  '';

  meta = with lib; {
    description = "Playpen Sans Deva";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
