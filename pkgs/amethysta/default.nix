{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amethysta-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/amethysta/Amethysta-Regular.ttf?raw=true";
      name = "Amethysta-Regular.ttf";
      sha256 = "5e192003ec8b95595c27737e2a2bb3c9db2e468b24b572a9183b2f0003143f1c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Amethysta-Regular.ttf $out/share/fonts/truetype/Amethysta-Regular.ttf
  '';

  meta = with lib; {
    description = "Amethysta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
