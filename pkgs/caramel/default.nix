{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "caramel-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/caramel/Caramel-Regular.ttf?raw=true";
      name = "Caramel-Regular.ttf";
      sha256 = "36a460f8418d5f9710da43404776fc914fe11ff5ec649e9c8bcb670c602b92be";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Caramel-Regular.ttf $out/share/fonts/truetype/Caramel-Regular.ttf
  '';

  meta = with lib; {
    description = "Caramel";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
