{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "my-soul-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/76cd30cda533ba978c384b5460d9c79e62b2eda3/ofl/mysoul/MySoul-Regular.ttf?raw=true";
      name = "MySoul-Regular.ttf";
      sha256 = "28bcb050c1220145fd6aff6f6f13b1b8f4a9608388c0c34e4ff94452e5e6444f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MySoul-Regular.ttf $out/share/fonts/truetype/MySoul-Regular.ttf
  '';

  meta = with lib; {
    description = "My Soul";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
