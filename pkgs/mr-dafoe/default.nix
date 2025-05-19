{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mr-dafoe-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mrdafoe/MrDafoe-Regular.ttf?raw=true";
      name = "MrDafoe-Regular.ttf";
      sha256 = "a42a3c66a709927f358243fdfcbc437bd8eb188e2ee6a680c52f5be12c670fd2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MrDafoe-Regular.ttf $out/share/fonts/truetype/MrDafoe-Regular.ttf
  '';

  meta = with lib; {
    description = "Mr Dafoe";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
