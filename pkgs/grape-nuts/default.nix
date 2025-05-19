{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "grape-nuts-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grapenuts/GrapeNuts-Regular.ttf?raw=true";
      name = "GrapeNuts-Regular.ttf";
      sha256 = "d4772724931dbafc507c610f10d8cffa4602f8b8e8abfc0bd384996875af4134";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GrapeNuts-Regular.ttf $out/share/fonts/truetype/GrapeNuts-Regular.ttf
  '';

  meta = with lib; {
    description = "Grape Nuts";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
