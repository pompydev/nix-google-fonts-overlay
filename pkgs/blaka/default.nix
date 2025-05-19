{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "blaka-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/blaka/Blaka-Regular.ttf?raw=true";
      name = "Blaka-Regular.ttf";
      sha256 = "5cd0ff67dcfbc371c6450afffe10f6e7027ffada0c31f436beb8865e57b781a3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Blaka-Regular.ttf $out/share/fonts/truetype/Blaka-Regular.ttf
  '';

  meta = with lib; {
    description = "Blaka";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
