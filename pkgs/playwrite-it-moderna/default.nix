{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-it-moderna-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteitmoderna/PlaywriteITModerna%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteITModerna_wght_.ttf";
      sha256 = "7ae45caca857ef73a70be1613ad376239ab32931f7ea808b22daab638edf95f4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteITModerna_wght_.ttf $out/share/fonts/truetype/PlaywriteITModerna_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite IT Moderna";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
