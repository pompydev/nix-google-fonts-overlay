{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "leckerli-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/leckerlione/LeckerliOne-Regular.ttf?raw=true";
      name = "LeckerliOne-Regular.ttf";
      sha256 = "3f38ed99a07ab426eaa64c7d5773850a5dc8e6719b03125efce2cfbc82b083d7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LeckerliOne-Regular.ttf $out/share/fonts/truetype/LeckerliOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Leckerli One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
