{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "miama-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/miama/Miama-Regular.ttf?raw=true";
      name = "Miama-Regular.ttf";
      sha256 = "2dfff84eb0d46ac727e99438417e244d3a92e4d09b26c3039b40d640f07aba6b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Miama-Regular.ttf $out/share/fonts/truetype/Miama-Regular.ttf
  '';

  meta = with lib; {
    description = "Miama";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
