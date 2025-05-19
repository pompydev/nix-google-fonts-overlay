{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "atomic-age-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/atomicage/AtomicAge-Regular.ttf?raw=true";
      name = "AtomicAge-Regular.ttf";
      sha256 = "5ea6111180af882b0799a1e1c04b7acc557807ff76e0cc24258b259a06f67ed2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AtomicAge-Regular.ttf $out/share/fonts/truetype/AtomicAge-Regular.ttf
  '';

  meta = with lib; {
    description = "Atomic Age";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
