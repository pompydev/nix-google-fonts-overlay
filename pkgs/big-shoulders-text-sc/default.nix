{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-text-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bigshoulderstextsc/BigShouldersTextSC%5Bwght%5D.ttf?raw=true";
      name = "BigShouldersTextSC_wght_.ttf";
      sha256 = "3f02d35b7776aca0b00a85dae9e6500cbc2c8646c802f330376d089557b6a8d4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersTextSC_wght_.ttf $out/share/fonts/truetype/BigShouldersTextSC_wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Text SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
