{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "keania-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/keaniaone/KeaniaOne-Regular.ttf?raw=true";
      name = "KeaniaOne-Regular.ttf";
      sha256 = "55c6be3d0cdc816c462bccbcc935ef20f560bd7aecbf1b38caed4752b52c14c0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KeaniaOne-Regular.ttf $out/share/fonts/truetype/KeaniaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Keania One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
