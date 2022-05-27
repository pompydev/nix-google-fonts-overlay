{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "scheherazade-new-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62bd0f389eb64cb9fdd08002b5e5ce00be9ba8a6/ofl/scheherazadenew/ScheherazadeNew-Regular.ttf?raw=true";
      name = "ScheherazadeNew-Regular.ttf";
      sha256 = "067ddb5b61c164bb353c06ecd256d7c90fd435eb4211448f6652095250424bf4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62bd0f389eb64cb9fdd08002b5e5ce00be9ba8a6/ofl/scheherazadenew/ScheherazadeNew-Bold.ttf?raw=true";
      name = "ScheherazadeNew-Bold.ttf";
      sha256 = "dfca099fedcf29c6a7c343a8346c6e24aa2ecff91bd2a754631d4c61a63ae722";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ScheherazadeNew-Regular.ttf $out/share/fonts/truetype/ScheherazadeNew-Regular.ttf
     install -Dm644 ScheherazadeNew-Bold.ttf $out/share/fonts/truetype/ScheherazadeNew-Bold.ttf
  '';

  meta = with lib; {
    description = "Scheherazade New";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
