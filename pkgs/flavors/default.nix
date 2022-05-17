{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "flavors-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7da86e3f405d4cf22e3949698519c75a021177db/ofl/flavors/Flavors-Regular.ttf?raw=true";
      name = "Flavors-Regular.ttf";
      sha256 = "4e651bcdabe9753092ab8b1a85487c934d93650401853a591bbdb4658bf502d8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Flavors-Regular.ttf $out/share/fonts/truetype/Flavors-Regular.ttf
  '';

  meta = with lib; {
    description = "Flavors";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
