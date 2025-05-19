{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stick-no-bills-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sticknobills/StickNoBills%5Bwght%5D.ttf?raw=true";
      name = "StickNoBills_wght_.ttf";
      sha256 = "4754d337fbf0cffac744b58316c3d091b7abc668d7b9fb5df082e1905b27c027";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 StickNoBills_wght_.ttf $out/share/fonts/truetype/StickNoBills_wght_.ttf
  '';

  meta = with lib; {
    description = "Stick No Bills";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
