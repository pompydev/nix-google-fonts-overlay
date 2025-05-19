{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mogra-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mogra/Mogra-Regular.ttf?raw=true";
      name = "Mogra-Regular.ttf";
      sha256 = "1d7133f5926cf5e7042b587b838bc5c5bcfe6c86b19157afd544c71a630159d8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mogra-Regular.ttf $out/share/fonts/truetype/Mogra-Regular.ttf
  '';

  meta = with lib; {
    description = "Mogra";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
