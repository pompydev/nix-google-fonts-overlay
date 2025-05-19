{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jaini-purva-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jainipurva/JainiPurva-Regular.ttf?raw=true";
      name = "JainiPurva-Regular.ttf";
      sha256 = "178d7f5a40594d4ef6c28b7a68d85da7eae46df2f71becedfb40251ff678c2f5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JainiPurva-Regular.ttf $out/share/fonts/truetype/JainiPurva-Regular.ttf
  '';

  meta = with lib; {
    description = "Jaini Purva";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
