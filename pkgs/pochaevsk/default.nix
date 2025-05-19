{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pochaevsk-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/pochaevsk/Pochaevsk-Regular.ttf?raw=true";
      name = "Pochaevsk-Regular.ttf";
      sha256 = "1c424dbaad55832f4067c631c89ecae1c917f23f8c33323987ea4a99f97012a8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Pochaevsk-Regular.ttf $out/share/fonts/truetype/Pochaevsk-Regular.ttf
  '';

  meta = with lib; {
    description = "Pochaevsk";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
