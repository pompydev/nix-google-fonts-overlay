{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sedan-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sedansc/SedanSC-Regular.ttf?raw=true";
      name = "SedanSC-Regular.ttf";
      sha256 = "b015b262e6138cd0e8279ba75695f07748af01f8a9eed5d4d536e283baa57314";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SedanSC-Regular.ttf $out/share/fonts/truetype/SedanSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Sedan SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
