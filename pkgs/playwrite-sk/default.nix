{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-sk-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritesk/PlaywriteSK%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteSK_wght_.ttf";
      sha256 = "781c0d8ae19485460f0f28747819900c780cba07a4e11f3a929fe40aa156a3c1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteSK_wght_.ttf $out/share/fonts/truetype/PlaywriteSK_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite SK";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
