{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pacifico-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/pacifico/Pacifico-Regular.ttf?raw=true";
      name = "Pacifico-Regular.ttf";
      sha256 = "5b6c0d5334a7bf77dea52b975c5a0c408878c0f7115ed5b6fb151f634b7bf701";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Pacifico-Regular.ttf $out/share/fonts/truetype/Pacifico-Regular.ttf
  '';

  meta = with lib; {
    description = "Pacifico";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
