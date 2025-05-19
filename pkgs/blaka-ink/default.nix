{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "blaka-ink-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/blakaink/BlakaInk-Regular.ttf?raw=true";
      name = "BlakaInk-Regular.ttf";
      sha256 = "d745f0be7cf43f4e8998834ef730b3cab22a82db19d6a1737008b7b4a87112ea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BlakaInk-Regular.ttf $out/share/fonts/truetype/BlakaInk-Regular.ttf
  '';

  meta = with lib; {
    description = "Blaka Ink";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
