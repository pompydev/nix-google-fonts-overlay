{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alike-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/alike/Alike-Regular.ttf?raw=true";
      name = "Alike-Regular.ttf";
      sha256 = "accb24221880fbdcf8e8b23fc341ed43c6e0cc3cef1dfbad57ac72474dc1e512";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alike-Regular.ttf $out/share/fonts/truetype/Alike-Regular.ttf
  '';

  meta = with lib; {
    description = "Alike";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
