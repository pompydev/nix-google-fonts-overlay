{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gidole-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gidole/Gidole-Regular.ttf?raw=true";
      name = "Gidole-Regular.ttf";
      sha256 = "7a9b54e2ce1f582cfcd1aa39ca025cd125084f4fb2ea35969d21f6544aa05f23";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gidole-Regular.ttf $out/share/fonts/truetype/Gidole-Regular.ttf
  '';

  meta = with lib; {
    description = "Gidole";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
