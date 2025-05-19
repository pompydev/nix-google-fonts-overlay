{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jsmath-cmsy10-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/jsmathcmsy10/jsMath-cmsy10.ttf?raw=true";
      name = "jsMath-cmsy10.ttf";
      sha256 = "9698e8f98809ce1ab9b88179309b427c7a4a17894e4e6e4328620c04225e2c43";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 jsMath-cmsy10.ttf $out/share/fonts/truetype/jsMath-cmsy10.ttf
  '';

  meta = with lib; {
    description = "jsMath cmsy10";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
