{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alumni-sans-collegiate-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/alumnisanscollegiateone/AlumniSansCollegiateOne-Regular.ttf?raw=true";
      name = "AlumniSansCollegiateOne-Regular.ttf";
      sha256 = "9bd48b280391794c7a5aea97476b25051b4705c7963e4b63b2c84876db31b59b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/alumnisanscollegiateone/AlumniSansCollegiateOne-Italic.ttf?raw=true";
      name = "AlumniSansCollegiateOne-Italic.ttf";
      sha256 = "aa1ec3cafa94926b00e61da029c48271e6845400167c10f8b659b938da9d54ee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlumniSansCollegiateOne-Regular.ttf $out/share/fonts/truetype/AlumniSansCollegiateOne-Regular.ttf
     install -Dm644 AlumniSansCollegiateOne-Italic.ttf $out/share/fonts/truetype/AlumniSansCollegiateOne-Italic.ttf
  '';

  meta = with lib; {
    description = "Alumni Sans Collegiate One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
