{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oooh-baby-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ooohbaby/OoohBaby-Regular.ttf?raw=true";
      name = "OoohBaby-Regular.ttf";
      sha256 = "904d1b79093da1ae4b7436ac2190ddf5048e3cb839b2dc0c0516d0f58a1c25ee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OoohBaby-Regular.ttf $out/share/fonts/truetype/OoohBaby-Regular.ttf
  '';

  meta = with lib; {
    description = "Oooh Baby";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
