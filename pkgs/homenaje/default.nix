{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "homenaje-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/homenaje/Homenaje-Regular.ttf?raw=true";
      name = "Homenaje-Regular.ttf";
      sha256 = "0bf7bae4aa3e7c2c674785325d20f4405a53f25ace4ceb4752cf75e27172be4a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Homenaje-Regular.ttf $out/share/fonts/truetype/Homenaje-Regular.ttf
  '';

  meta = with lib; {
    description = "Homenaje";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
