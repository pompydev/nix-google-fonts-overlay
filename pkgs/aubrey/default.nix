{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aubrey-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4678b39ef50659bf72cf21c2b38ff83280d82a99/ofl/aubrey/Aubrey-Regular.ttf?raw=true";
      name = "Aubrey-Regular.ttf";
      sha256 = "0e5d5bcacda38d60d25b2c61a2b7130a91d20f0cab28072fccf29185fc2c3176";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Aubrey-Regular.ttf $out/share/fonts/truetype/Aubrey-Regular.ttf
  '';

  meta = with lib; {
    description = "Aubrey";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
