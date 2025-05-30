{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "edu-qld-beginner-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/eduqldbeginner/EduQLDBeginner%5Bwght%5D.ttf?raw=true";
      name = "EduQLDBeginner_wght_.ttf";
      sha256 = "de937b07983c86f690a114d012c5d38cc607cb11cd75aa2cbfa638d5ae109c39";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EduQLDBeginner_wght_.ttf $out/share/fonts/truetype/EduQLDBeginner_wght_.ttf
  '';

  meta = with lib; {
    description = "Edu QLD Beginner";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
