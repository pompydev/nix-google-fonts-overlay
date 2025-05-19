{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lovers-quarrel-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/loversquarrel/LoversQuarrel-Regular.ttf?raw=true";
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
