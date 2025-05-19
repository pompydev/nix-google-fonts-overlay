{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "junge-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/junge/Junge-Regular.ttf?raw=true";
      name = "Junge-Regular.ttf";
      sha256 = "4671c65a0e6c02c866362938e968e083d171744e4c90fa2cfa8b809cc9f7207e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Junge-Regular.ttf $out/share/fonts/truetype/Junge-Regular.ttf
  '';

  meta = with lib; {
    description = "Junge";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
