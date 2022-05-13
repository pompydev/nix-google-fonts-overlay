{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dela-gothic-one-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c78f24ab5a959d45c42b8971b4e9a0e345ad454e/ofl/delagothicone/DelaGothicOne-Regular.ttf?raw=true";
      name = "DelaGothicOne-Regular.ttf";
      sha256 = "4ff87a0965f1b0505e5a2c58424bc6ad3cff27e56a82f21c2fc9d6b0e3857ee2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DelaGothicOne-Regular.ttf $out/share/fonts/truetype/DelaGothicOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Dela Gothic One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
