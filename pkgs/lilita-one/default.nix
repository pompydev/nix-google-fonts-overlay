{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lilita-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/lilitaone/LilitaOne-Regular.ttf?raw=true";
      name = "LilitaOne-Regular.ttf";
      sha256 = "f5b641c45c69d772ee4eda687bc9fda411d5cad6b0b45371491da4580cbc8d59";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LilitaOne-Regular.ttf $out/share/fonts/truetype/LilitaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Lilita One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
