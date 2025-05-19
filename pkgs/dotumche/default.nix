{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dotumche-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dotumche/DotumChe-Regular.ttf?raw=true";
      name = "DotumChe-Regular.ttf";
      sha256 = "c2c030ca896d46ff28dae17663e9fe22ab2fc6e6518c96d75e15ca8fb441bd2f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DotumChe-Regular.ttf $out/share/fonts/truetype/DotumChe-Regular.ttf
  '';

  meta = with lib; {
    description = "DotumChe";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
