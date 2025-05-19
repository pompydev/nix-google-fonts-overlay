{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-id-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteid/PlaywriteID%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteID_wght_.ttf";
      sha256 = "a05ac2854b68594d69172981f743d4c0e4b2655fd3020006a15ea2e8ee4af7b2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteID_wght_.ttf $out/share/fonts/truetype/PlaywriteID_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite ID";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
