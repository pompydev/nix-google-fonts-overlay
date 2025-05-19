{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "patua-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/patuaone/PatuaOne-Regular.ttf?raw=true";
      name = "PatuaOne-Regular.ttf";
      sha256 = "a3faa8b9efdd9d89980b56fa2b080669d66f3f977f07a2a6295498dbe7c26a7c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PatuaOne-Regular.ttf $out/share/fonts/truetype/PatuaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Patua One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
