{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pushster-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a2e33f35fddfb580f42350a8dd78230d2b41c7bb/ofl/pushster/Pushster-Regular.ttf?raw=true";
      name = "Pushster-Regular.ttf";
      sha256 = "d6568e697fd50cedc0be04d8aae4127fe95add607e7bff954ca88604be80c205";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Pushster-Regular.ttf $out/share/fonts/truetype/Pushster-Regular.ttf
  '';

  meta = with lib; {
    description = "Pushster";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
