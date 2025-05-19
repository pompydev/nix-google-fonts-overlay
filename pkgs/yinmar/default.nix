{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yinmar-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/yinmar/Yinmar-Regular.ttf?raw=true";
      name = "Yinmar-Regular.ttf";
      sha256 = "a1976639a99f252b3471839c85fe5e87fc1c4e0d1386c9f8ac8c5ff84d357e35";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yinmar-Regular.ttf $out/share/fonts/truetype/Yinmar-Regular.ttf
  '';

  meta = with lib; {
    description = "Yinmar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
