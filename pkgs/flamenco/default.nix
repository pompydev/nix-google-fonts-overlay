{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "flamenco-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/flamenco/Flamenco-Light.ttf?raw=true";
      name = "Flamenco-Light.ttf";
      sha256 = "6e755ea4c20b869dd7463c0f2a5b37aae0be6b158d0ef8281b0374af3c515210";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/flamenco/Flamenco-Regular.ttf?raw=true";
      name = "Flamenco-Regular.ttf";
      sha256 = "4de67f9c6b2444ae2073c236f0829c95d380c5ef44aff4539754888fc2e3cf23";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Flamenco-Light.ttf $out/share/fonts/truetype/Flamenco-Light.ttf
     install -Dm644 Flamenco-Regular.ttf $out/share/fonts/truetype/Flamenco-Regular.ttf
  '';

  meta = with lib; {
    description = "Flamenco";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
