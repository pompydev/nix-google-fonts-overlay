{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-cz-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritecz/PlaywriteCZ%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteCZ_wght_.ttf";
      sha256 = "39e8aedac9ab5a9d9e5003359f0a6631fced9d4531d15db0dd5d9efdadd0fcae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteCZ_wght_.ttf $out/share/fonts/truetype/PlaywriteCZ_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite CZ";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
