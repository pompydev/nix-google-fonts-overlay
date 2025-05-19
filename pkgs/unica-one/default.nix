{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "unica-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/unicaone/UnicaOne-Regular.ttf?raw=true";
      name = "UnicaOne-Regular.ttf";
      sha256 = "5d5861ae199cb69049e77e7cd08a8ffd6c14e90da19c8db8df0f4004ca93bd8f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 UnicaOne-Regular.ttf $out/share/fonts/truetype/UnicaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Unica One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
