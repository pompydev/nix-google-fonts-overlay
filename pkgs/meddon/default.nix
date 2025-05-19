{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "meddon-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/meddon/Meddon.ttf?raw=true";
      name = "Meddon.ttf";
      sha256 = "c983e998ff7e01242544659c971bf4055bfb43a9fc5a0dd83ca7dafd105f94da";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Meddon.ttf $out/share/fonts/truetype/Meddon.ttf
  '';

  meta = with lib; {
    description = "Meddon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
