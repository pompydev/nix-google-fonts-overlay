{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "annapurna-sil-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/annapurnasil/AnnapurnaSIL-Regular.ttf?raw=true";
      name = "AnnapurnaSIL-Regular.ttf";
      sha256 = "f5f80335993c983ebf811b27fe07604b01d207f7c3b66c8798c3d721d164088c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/annapurnasil/AnnapurnaSIL-Bold.ttf?raw=true";
      name = "AnnapurnaSIL-Bold.ttf";
      sha256 = "c73a534c69802dfb8b8da42e9544ae479edd6bcfec51f42c9aa5c46310a7cecf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnnapurnaSIL-Regular.ttf $out/share/fonts/truetype/AnnapurnaSIL-Regular.ttf
     install -Dm644 AnnapurnaSIL-Bold.ttf $out/share/fonts/truetype/AnnapurnaSIL-Bold.ttf
  '';

  meta = with lib; {
    description = "Annapurna SIL";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
