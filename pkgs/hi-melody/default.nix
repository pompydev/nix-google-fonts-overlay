{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hi-melody-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/himelody/HiMelody-Regular.ttf?raw=true";
      name = "HiMelody-Regular.ttf";
      sha256 = "360d2c0a880918aa48328d1d9219f5390788d09a1c9353e12b471de018673ae6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HiMelody-Regular.ttf $out/share/fonts/truetype/HiMelody-Regular.ttf
  '';

  meta = with lib; {
    description = "Hi Melody";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
