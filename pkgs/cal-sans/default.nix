{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cal-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/calsans/CalSans-Regular.ttf?raw=true";
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
