{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kotta-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kottaone/KottaOne-Regular.ttf?raw=true";
      name = "KottaOne-Regular.ttf";
      sha256 = "17b1dd75c9ebd632b5df2b052fe5ae83139516a56e8367c5027dbbfd4ac5b184";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KottaOne-Regular.ttf $out/share/fonts/truetype/KottaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Kotta One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
