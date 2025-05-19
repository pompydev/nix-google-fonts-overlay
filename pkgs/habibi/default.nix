{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "habibi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/habibi/Habibi-Regular.ttf?raw=true";
      name = "Habibi-Regular.ttf";
      sha256 = "65ae905bf98ae8ca0ec67786d01cdc1add55759dbb8b99e7da0d368f9ea74671";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Habibi-Regular.ttf $out/share/fonts/truetype/Habibi-Regular.ttf
  '';

  meta = with lib; {
    description = "Habibi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
