{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rationale-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rationale/Rationale-Regular.ttf?raw=true";
      name = "Rationale-Regular.ttf";
      sha256 = "744e163c734a06bd20da3737d0cc4ceb8dc5a8c09fdfd4e9feacbeddd2081c5c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rationale-Regular.ttf $out/share/fonts/truetype/Rationale-Regular.ttf
  '';

  meta = with lib; {
    description = "Rationale";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
