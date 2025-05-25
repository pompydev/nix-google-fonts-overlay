{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "darker-grotesque-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/darkergrotesque/DarkerGrotesque%5Bwght%5D.ttf?raw=true";
      name = "DarkerGrotesque_wght_.ttf";
      sha256 = "ed61c00a14f571096a8c03d00f91d37907df9d55da7cd7444914353ca224cb86";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DarkerGrotesque_wght_.ttf $out/share/fonts/truetype/DarkerGrotesque_wght_.ttf
  '';

  meta = with lib; {
    description = "Darker Grotesque";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
