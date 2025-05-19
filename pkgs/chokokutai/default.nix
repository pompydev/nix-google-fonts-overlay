{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chokokutai-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/chokokutai/Chokokutai-Regular.ttf?raw=true";
      name = "Chokokutai-Regular.ttf";
      sha256 = "c622b971d1bdb2d8cd64f978746e6d52d361417ae4222c275cb57549e34e097e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chokokutai-Regular.ttf $out/share/fonts/truetype/Chokokutai-Regular.ttf
  '';

  meta = with lib; {
    description = "Chokokutai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
