{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aboreto-${version}";
  version = "2022-06-01-134329";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cb1d70a463c113cb2c7e2b38a9faf169732a71ba/ofl/aboreto/Aboreto-Regular.ttf?raw=true";
      name = "Aboreto-Regular.ttf";
      sha256 = "b9458031bcba06d9b6053ad866c017e1bed673644ca7bd8660cbe0d0c900b8a6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Aboreto-Regular.ttf $out/share/fonts/truetype/Aboreto-Regular.ttf
  '';

  meta = with lib; {
    description = "Aboreto";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
