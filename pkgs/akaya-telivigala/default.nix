{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "akaya-telivigala-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7b4021c0a1fb54537ea9d050e97e83fa9ea0ed88/ofl/akayatelivigala/AkayaTelivigala-Regular.ttf?raw=true";
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
