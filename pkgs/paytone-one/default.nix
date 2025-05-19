{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "paytone-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/paytoneone/PaytoneOne-Regular.ttf?raw=true";
      name = "PaytoneOne-Regular.ttf";
      sha256 = "1c07073b0b578199b54c7866d55e2b631d285e8aa4bb4fbc08809d980cd49b14";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PaytoneOne-Regular.ttf $out/share/fonts/truetype/PaytoneOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Paytone One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
