{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pangolin-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/pangolin/Pangolin-Regular.ttf?raw=true";
      name = "Pangolin-Regular.ttf";
      sha256 = "cf4f0a46704c7859d4943320fce6c6d06cc7dc450ef971c3676ef36f9f482299";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Pangolin-Regular.ttf $out/share/fonts/truetype/Pangolin-Regular.ttf
  '';

  meta = with lib; {
    description = "Pangolin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
