{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "edu-sa-beginner-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/edusabeginner/EduSABeginner%5Bwght%5D.ttf?raw=true";
      name = "EduSABeginner_wght_.ttf";
      sha256 = "1ec0d8b4f3a6fda018079fa284570d2c4a3a514e3687d139b25b05dbb86c7ff4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EduSABeginner_wght_.ttf $out/share/fonts/truetype/EduSABeginner_wght_.ttf
  '';

  meta = with lib; {
    description = "Edu SA Beginner";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
