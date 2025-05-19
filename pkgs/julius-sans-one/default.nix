{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "julius-sans-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/juliussansone/JuliusSansOne-Regular.ttf?raw=true";
      name = "JuliusSansOne-Regular.ttf";
      sha256 = "b540bcad9283f58955a8db82d8103b1fd356378f55ec764cdb20d9f5ae749f23";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JuliusSansOne-Regular.ttf $out/share/fonts/truetype/JuliusSansOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Julius Sans One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
