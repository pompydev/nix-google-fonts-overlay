{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-au-vic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteauvic/PlaywriteAUVIC%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteAUVIC_wght_.ttf";
      sha256 = "91a7b57af8b6b86f00b7757eab8b4236b25ee4f45c78610be5c79433fce6f914";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteAUVIC_wght_.ttf $out/share/fonts/truetype/PlaywriteAUVIC_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite AU VIC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
