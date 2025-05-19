{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inspiration-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/inspiration/Inspiration-Regular.ttf?raw=true";
      name = "Inspiration-Regular.ttf";
      sha256 = "4308040c6993a16772fb6a09d8b38e0ae0222c81c60615cf4d80aad0e3dfabf6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Inspiration-Regular.ttf $out/share/fonts/truetype/Inspiration-Regular.ttf
  '';

  meta = with lib; {
    description = "Inspiration";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
