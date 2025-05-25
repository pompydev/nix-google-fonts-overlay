{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "strait-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/strait/Strait-Regular.ttf?raw=true";
      name = "Strait-Regular.ttf";
      sha256 = "f705c4ade7470e084582b1f5a1f1e45c16524c7b30ce81204c76236ef4ffbb38";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Strait-Regular.ttf $out/share/fonts/truetype/Strait-Regular.ttf
  '';

  meta = with lib; {
    description = "Strait";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
