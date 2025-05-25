{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bubblegum-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bubblegumsans/BubblegumSans-Regular.ttf?raw=true";
      name = "BubblegumSans-Regular.ttf";
      sha256 = "db8d1c71c398266ecabe9ae4923c4feb1323441a4f056a9339e41d8f847bd0c0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BubblegumSans-Regular.ttf $out/share/fonts/truetype/BubblegumSans-Regular.ttf
  '';

  meta = with lib; {
    description = "Bubblegum Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
