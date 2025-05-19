{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dhurjati-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dhurjati/Dhurjati-Regular.ttf?raw=true";
      name = "Dhurjati-Regular.ttf";
      sha256 = "7f82ab141b77d263f9ea9b31b47faf50c11310f42fce6d9dffeaaa334909bbf9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dhurjati-Regular.ttf $out/share/fonts/truetype/Dhurjati-Regular.ttf
  '';

  meta = with lib; {
    description = "Dhurjati";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
