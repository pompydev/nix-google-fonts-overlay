{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chilanka-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0d26823e6a2fae2c57605f689c62c9ef03cc5f03/ofl/chilanka/Chilanka-Regular.ttf?raw=true";
      name = "Chilanka-Regular.ttf";
      sha256 = "10de9330ad0bae74f786a23b7761d538767d715f7b5b97d3b87e5fee58002ac2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chilanka-Regular.ttf $out/share/fonts/truetype/Chilanka-Regular.ttf
  '';

  meta = with lib; {
    description = "Chilanka";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
