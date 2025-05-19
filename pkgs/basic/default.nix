{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "basic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/basic/Basic-Regular.ttf?raw=true";
      name = "Basic-Regular.ttf";
      sha256 = "077f7245f6459045495b1ca0493f2b426c421d2112d10b48a38ff8858a07397a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Basic-Regular.ttf $out/share/fonts/truetype/Basic-Regular.ttf
  '';

  meta = with lib; {
    description = "Basic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
