{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alkalami-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/alkalami/Alkalami-Regular.ttf?raw=true";
      name = "Alkalami-Regular.ttf";
      sha256 = "4410dfc591b918dd4360b0252b079855a8a00250de363c8c0163b29ddfc56434";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alkalami-Regular.ttf $out/share/fonts/truetype/Alkalami-Regular.ttf
  '';

  meta = with lib; {
    description = "Alkalami";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
