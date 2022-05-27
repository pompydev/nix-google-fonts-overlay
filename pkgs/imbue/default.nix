{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "imbue-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5377e4c5ca6b224e0deb0dee313888bb46eaea35/ofl/imbue/Imbue%5Bopsz,wght%5D.ttf?raw=true";
      name = "Imbue_opsz,wght_.ttf";
      sha256 = "bf45ff1dc01974acedf4f11bcbfa7365053d97f4d598ddafe189d238ac80a534";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Imbue_opsz,wght_.ttf $out/share/fonts/truetype/Imbue_opsz,wght_.ttf
  '';

  meta = with lib; {
    description = "Imbue";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
