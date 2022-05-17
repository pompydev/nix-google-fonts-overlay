{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "praise-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a765c62aae4cbd596178b511afcfba84a3e34e25/ofl/praise/Praise-Regular.ttf?raw=true";
      name = "Praise-Regular.ttf";
      sha256 = "1f9e88031638c7f3c238f5b44a9d745041b1620208a77ecbefb62b10b0ffb214";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Praise-Regular.ttf $out/share/fonts/truetype/Praise-Regular.ttf
  '';

  meta = with lib; {
    description = "Praise";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
