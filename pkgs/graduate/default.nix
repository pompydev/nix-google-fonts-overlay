{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "graduate-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/graduate/Graduate-Regular.ttf?raw=true";
      name = "Graduate-Regular.ttf";
      sha256 = "971222b309851d86f2513f89b510dc52d52ef7798b5f43af2c6f58d43df568e5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Graduate-Regular.ttf $out/share/fonts/truetype/Graduate-Regular.ttf
  '';

  meta = with lib; {
    description = "Graduate";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
