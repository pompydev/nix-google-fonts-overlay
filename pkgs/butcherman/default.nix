{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "butcherman-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/butcherman/Butcherman-Regular.ttf?raw=true";
      name = "Butcherman-Regular.ttf";
      sha256 = "b8cee5e2cdc71f44e6806dc0db1090a3ce2e48ca727072073700bf646b0ce6b5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Butcherman-Regular.ttf $out/share/fonts/truetype/Butcherman-Regular.ttf
  '';

  meta = with lib; {
    description = "Butcherman";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
