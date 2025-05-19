{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oregano-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/oregano/Oregano-Regular.ttf?raw=true";
      name = "Oregano-Regular.ttf";
      sha256 = "0c2eaed981aeefa8445c4a937794fd1ec7dd5a5b40ff60307a59775cc239b187";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/oregano/Oregano-Italic.ttf?raw=true";
      name = "Oregano-Italic.ttf";
      sha256 = "5e4df67997869d4e68dba1a38463a70c8679d29cb7ac678779631db9382f5538";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Oregano-Regular.ttf $out/share/fonts/truetype/Oregano-Regular.ttf
     install -Dm644 Oregano-Italic.ttf $out/share/fonts/truetype/Oregano-Italic.ttf
  '';

  meta = with lib; {
    description = "Oregano";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
