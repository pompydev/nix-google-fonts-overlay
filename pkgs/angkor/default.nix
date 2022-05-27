{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "angkor-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8328055ac9d624a301f293060123ea8419bf1cad/ofl/angkor/Angkor-Regular.ttf?raw=true";
      name = "Angkor-Regular.ttf";
      sha256 = "ef3a846370cf0a5f6d5718162cb9133a1a9243586f32faf6cdbc449594a3dc1c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Angkor-Regular.ttf $out/share/fonts/truetype/Angkor-Regular.ttf
  '';

  meta = with lib; {
    description = "Angkor";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
