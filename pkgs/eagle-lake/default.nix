{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "eagle-lake-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/eaglelake/EagleLake-Regular.ttf?raw=true";
      name = "EagleLake-Regular.ttf";
      sha256 = "53a4e929c9ea3584f2432157fd549c7604e6be7e6c4b39873f34fae7f6823928";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EagleLake-Regular.ttf $out/share/fonts/truetype/EagleLake-Regular.ttf
  '';

  meta = with lib; {
    description = "Eagle Lake";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
