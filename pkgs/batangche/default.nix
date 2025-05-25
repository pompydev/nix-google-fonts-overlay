{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "batangche-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/batangche/BatangChe-Regular.ttf?raw=true";
      name = "BatangChe-Regular.ttf";
      sha256 = "34aff823e0d9b86e7b7cb6913612e06638812a1d9af061272510b4cbf9d4c6ba";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BatangChe-Regular.ttf $out/share/fonts/truetype/BatangChe-Regular.ttf
  '';

  meta = with lib; {
    description = "BatangChe";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
