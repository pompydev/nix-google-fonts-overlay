{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "moulpali-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/moulpali/Moulpali-Regular.ttf?raw=true";
      name = "Moulpali-Regular.ttf";
      sha256 = "555fa15b85a70b3b18c182ccd26a24f2e1babaf64fb53ba31bbf91327a7b31b4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Moulpali-Regular.ttf $out/share/fonts/truetype/Moulpali-Regular.ttf
  '';

  meta = with lib; {
    description = "Moulpali";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
