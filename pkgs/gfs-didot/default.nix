{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gfs-didot-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gfsdidot/GFSDidot-Regular.ttf?raw=true";
      name = "GFSDidot-Regular.ttf";
      sha256 = "4fc784ab824e8866eeef8ad55976b93e7e170fb1b8237fd4f8781b5b4dd297f9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GFSDidot-Regular.ttf $out/share/fonts/truetype/GFSDidot-Regular.ttf
  '';

  meta = with lib; {
    description = "GFS Didot";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
