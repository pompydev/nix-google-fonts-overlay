{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dekko-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dekko/Dekko-Regular.ttf?raw=true";
      name = "Dekko-Regular.ttf";
      sha256 = "e6b151a5bdc521833ceb9a4f8010195515259e9416abfe055cfd16adb2e1af42";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dekko-Regular.ttf $out/share/fonts/truetype/Dekko-Regular.ttf
  '';

  meta = with lib; {
    description = "Dekko";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
