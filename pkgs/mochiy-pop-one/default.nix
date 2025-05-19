{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mochiy-pop-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mochiypopone/MochiyPopOne-Regular.ttf?raw=true";
      name = "MochiyPopOne-Regular.ttf";
      sha256 = "9e009430e1316c271a5f34759c6b65fc343c4e806f193042528887e7235a92c6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MochiyPopOne-Regular.ttf $out/share/fonts/truetype/MochiyPopOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Mochiy Pop One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
