{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hubballi-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/29cde031be655567b6b237d401f3e1a172861e84/ofl/hubballi/Hubballi-Regular.ttf?raw=true";
      name = "Hubballi-Regular.ttf";
      sha256 = "e51ad77d40b5adccd6c6ca537863ef4e364bd374c56593e007fbf5402a9a1cdd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Hubballi-Regular.ttf $out/share/fonts/truetype/Hubballi-Regular.ttf
  '';

  meta = with lib; {
    description = "Hubballi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
