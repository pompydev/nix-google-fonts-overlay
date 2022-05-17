{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "caveat-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a85fc09e44c70c7159761adfdc9d5dd007792c15/ofl/caveat/Caveat[wght].ttf?raw=true";
      name = "Caveat_wght_.ttf";
      sha256 = "0bdb6b660482d31531b3945849fba5916b3ef8695da7024a9e6b9ee3c4157988";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Caveat_wght_.ttf $out/share/fonts/truetype/Caveat_wght_.ttf
  '';

  meta = with lib; {
    description = "Caveat";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
