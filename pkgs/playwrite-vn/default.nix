{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-vn-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritevn/PlaywriteVN%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteVN_wght_.ttf";
      sha256 = "da510f64ce3e9844f169f7c742a9f1370ade81bcf9ad17c7409137ba3f3d604c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteVN_wght_.ttf $out/share/fonts/truetype/PlaywriteVN_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite VN";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
