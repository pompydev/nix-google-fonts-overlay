{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "babylonica-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/53d6b71b49618e991330149bb7d77112bc48dbd4/ofl/babylonica/Babylonica-Regular.ttf?raw=true";
      name = "Babylonica-Regular.ttf";
      sha256 = "d033b18ba66881e0f066ebc66b457944e0dc51e981f9be61c8365d4bcfdb165c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Babylonica-Regular.ttf $out/share/fonts/truetype/Babylonica-Regular.ttf
  '';

  meta = with lib; {
    description = "Babylonica";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
