{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mooli-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mooli/Mooli-Regular.ttf?raw=true";
      name = "Mooli-Regular.ttf";
      sha256 = "1ab6e242c359f16f2a30741c21634c9f4a4183426730928f9545a2aeeb14078a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mooli-Regular.ttf $out/share/fonts/truetype/Mooli-Regular.ttf
  '';

  meta = with lib; {
    description = "Mooli";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
