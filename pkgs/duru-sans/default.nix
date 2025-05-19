{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "duru-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/durusans/DuruSans-Regular.ttf?raw=true";
      name = "DuruSans-Regular.ttf";
      sha256 = "edd15a5596318ecc635484f7b4fcb34c6dcaa7be8f85c4d2e9273ad8db688ff0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DuruSans-Regular.ttf $out/share/fonts/truetype/DuruSans-Regular.ttf
  '';

  meta = with lib; {
    description = "Duru Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
