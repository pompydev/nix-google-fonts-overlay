{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kirang-haerang-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kiranghaerang/KirangHaerang-Regular.ttf?raw=true";
      name = "KirangHaerang-Regular.ttf";
      sha256 = "d677d28d466989017c520f00a2a7794ea581ea3d9fa9a830fbb44f1015eac72d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KirangHaerang-Regular.ttf $out/share/fonts/truetype/KirangHaerang-Regular.ttf
  '';

  meta = with lib; {
    description = "Kirang Haerang";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
