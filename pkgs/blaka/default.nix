{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "blaka-${version}";
  version = "2022-04-27-084323";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0a949b872d3f954f054667819ba82cae4aba4278/ofl/blaka/Blaka-Regular.ttf?raw=true";
      name = "Blaka-Regular.ttf";
      sha256 = "f54c65006dff81fe32cad37851c28ba96842d173d2f7fd38ab6428e9913da3b5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Blaka-Regular.ttf $out/share/fonts/truetype/Blaka-Regular.ttf
  '';

  meta = with lib; {
    description = "Blaka";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
