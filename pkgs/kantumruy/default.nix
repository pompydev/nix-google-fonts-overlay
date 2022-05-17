{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kantumruy-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9cb4270d0cd240f7fe58129f150a9351e60c4d5e/ofl/kantumruy/Kantumruy-Light.ttf?raw=true";
      name = "Kantumruy-Light.ttf";
      sha256 = "21124042f062c601a2b35c688aa9a7ceca489640b9459c50a3bf249baa506172";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9cb4270d0cd240f7fe58129f150a9351e60c4d5e/ofl/kantumruy/Kantumruy-Regular.ttf?raw=true";
      name = "Kantumruy-Regular.ttf";
      sha256 = "c77d11f22eb9223f98b8c59a2f325c06defab3546584c6695f9d18c87dc4922a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9cb4270d0cd240f7fe58129f150a9351e60c4d5e/ofl/kantumruy/Kantumruy-Bold.ttf?raw=true";
      name = "Kantumruy-Bold.ttf";
      sha256 = "0b20134d3ae5afabefdc2676cc9b157a768894002fbd910623547c2e45de3ec5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kantumruy-Light.ttf $out/share/fonts/truetype/Kantumruy-Light.ttf
     install -Dm644 Kantumruy-Regular.ttf $out/share/fonts/truetype/Kantumruy-Regular.ttf
     install -Dm644 Kantumruy-Bold.ttf $out/share/fonts/truetype/Kantumruy-Bold.ttf
  '';

  meta = with lib; {
    description = "Kantumruy";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
