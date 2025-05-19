{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shafarik-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shafarik/Shafarik-Regular.ttf?raw=true";
      name = "Shafarik-Regular.ttf";
      sha256 = "b25cb985bffa87ece4c4ec9d5c62c28623de9a7016978bda41d7df01cb17f028";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Shafarik-Regular.ttf $out/share/fonts/truetype/Shafarik-Regular.ttf
  '';

  meta = with lib; {
    description = "Shafarik";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
