{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cal-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/calsans/CalSans-Regular.ttf?raw=true";
      name = "CalSans-Regular.ttf";
      sha256 = "040f5d1335848146e769ca40ce9664ca8b7639eecdd7316f468b7db20d1c9c01";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CalSans-Regular.ttf $out/share/fonts/truetype/CalSans-Regular.ttf
  '';

  meta = with lib; {
    description = "Cal Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
