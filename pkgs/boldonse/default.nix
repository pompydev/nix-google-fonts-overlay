{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "boldonse-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/boldonse/Boldonse-Regular.ttf?raw=true";
      name = "Boldonse-Regular.ttf";
      sha256 = "f566c572a85fee25b41ccab1a8d18ef8039a30e3ca44f310ee162899ea6d5fc7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Boldonse-Regular.ttf $out/share/fonts/truetype/Boldonse-Regular.ttf
  '';

  meta = with lib; {
    description = "Boldonse";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
