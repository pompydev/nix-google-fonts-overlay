{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "monomakh-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/monomakh/Monomakh-Regular.ttf?raw=true";
      name = "Monomakh-Regular.ttf";
      sha256 = "c0d38d79252b758a61adb31101f202450ff11305a675481525ecdcc294b800bf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Monomakh-Regular.ttf $out/share/fonts/truetype/Monomakh-Regular.ttf
  '';

  meta = with lib; {
    description = "Monomakh";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
