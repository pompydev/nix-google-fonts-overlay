{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "signika-negative-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/signikanegative/SignikaNegative%5Bwght%5D.ttf?raw=true";
      name = "SignikaNegative_wght_.ttf";
      sha256 = "2d111b1f760fdf84739371f11c88d47d47f642ad643039d3e639466606a5cdec";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SignikaNegative_wght_.ttf $out/share/fonts/truetype/SignikaNegative_wght_.ttf
  '';

  meta = with lib; {
    description = "Signika Negative";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
