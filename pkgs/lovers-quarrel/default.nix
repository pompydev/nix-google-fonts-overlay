{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lovers-quarrel-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/385af64e06099604fd67c2b002c915748892358b/ofl/loversquarrel/LoversQuarrel-Regular.ttf?raw=true";
      name = "LoversQuarrel-Regular.ttf";
      sha256 = "a856cd5a36d050a6e7fb4b976143e6ddad8271bdeebfb2c2efec78ab0f8569b6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LoversQuarrel-Regular.ttf $out/share/fonts/truetype/LoversQuarrel-Regular.ttf
  '';

  meta = with lib; {
    description = "Lovers Quarrel";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
