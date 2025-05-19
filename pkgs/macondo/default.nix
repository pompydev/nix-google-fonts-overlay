{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "macondo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/macondo/Macondo-Regular.ttf?raw=true";
      name = "Macondo-Regular.ttf";
      sha256 = "1910fe29b60588799474ea6281b59e131e33e96c77bfb80722a4c7f8133db4aa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Macondo-Regular.ttf $out/share/fonts/truetype/Macondo-Regular.ttf
  '';

  meta = with lib; {
    description = "Macondo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
