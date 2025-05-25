{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gloock-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gloock/Gloock-Regular.ttf?raw=true";
      name = "Gloock-Regular.ttf";
      sha256 = "c3a67e0212f7da01764796ae721cb9bab3e122d142354f97cf9c63fb763e6d77";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gloock-Regular.ttf $out/share/fonts/truetype/Gloock-Regular.ttf
  '';

  meta = with lib; {
    description = "Gloock";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
