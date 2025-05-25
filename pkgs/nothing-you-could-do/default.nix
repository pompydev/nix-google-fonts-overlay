{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nothing-you-could-do-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nothingyoucoulddo/NothingYouCouldDo.ttf?raw=true";
      name = "NothingYouCouldDo.ttf";
      sha256 = "1daf8cf79076bf59c5a9117b5efd6ecea35e57a05ef127fe4f95b072b8a5245d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NothingYouCouldDo.ttf $out/share/fonts/truetype/NothingYouCouldDo.ttf
  '';

  meta = with lib; {
    description = "Nothing You Could Do";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
