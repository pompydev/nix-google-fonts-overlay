{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hubballi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/hubballi/Hubballi-Regular.ttf?raw=true";
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
