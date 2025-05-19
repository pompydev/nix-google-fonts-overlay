{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "forum-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/forum/Forum-Regular.ttf?raw=true";
      name = "Forum-Regular.ttf";
      sha256 = "5c9fbe9c4ce76d0269f5088d921d57e58082fd9c28433eacb6de95baf938adf8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Forum-Regular.ttf $out/share/fonts/truetype/Forum-Regular.ttf
  '';

  meta = with lib; {
    description = "Forum";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
