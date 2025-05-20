{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cairo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cairo/Cairo%5Bslnt,wght%5D.ttf?raw=true";
      name = "Cairo_slnt,wght_.ttf";
      sha256 = "667c987182391c91f4e57a2f455b1794fb5e3ee6ca4ef3383e86bb690fa9c964";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cairo_slnt-wght_.ttf $out/share/fonts/truetype/Cairo_slnt-wght_.ttf
  '';

  meta = with lib; {
    description = "Cairo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
