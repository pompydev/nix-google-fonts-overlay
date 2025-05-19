{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jaini-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jaini/Jaini-Regular.ttf?raw=true";
      name = "Jaini-Regular.ttf";
      sha256 = "67224e60cafa27291c4b03cd907ca61ec678ba59fc1743af89da4472ea50d5c7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jaini-Regular.ttf $out/share/fonts/truetype/Jaini-Regular.ttf
  '';

  meta = with lib; {
    description = "Jaini";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
