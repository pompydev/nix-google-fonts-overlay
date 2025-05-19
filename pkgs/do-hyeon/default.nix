{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "do-hyeon-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dohyeon/DoHyeon-Regular.ttf?raw=true";
      name = "DoHyeon-Regular.ttf";
      sha256 = "35644be7f28e0a68a447b1f7af351dcde5674b870f24f7b5f43e26d00b4ab653";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DoHyeon-Regular.ttf $out/share/fonts/truetype/DoHyeon-Regular.ttf
  '';

  meta = with lib; {
    description = "Do Hyeon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
