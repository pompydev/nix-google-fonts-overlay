{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "akaya-telivigala-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/akayatelivigala/AkayaTelivigala-Regular.ttf?raw=true";
      name = "AkayaTelivigala-Regular.ttf";
      sha256 = "e57498133912f5abab1651ac44654fd67ebefebb489052748587b4ba33e182c2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AkayaTelivigala-Regular.ttf $out/share/fonts/truetype/AkayaTelivigala-Regular.ttf
  '';

  meta = with lib; {
    description = "Akaya Telivigala";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
