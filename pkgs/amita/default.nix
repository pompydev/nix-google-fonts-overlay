{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amita-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/amita/Amita-Regular.ttf?raw=true";
      name = "Amita-Regular.ttf";
      sha256 = "551369ea6a8caeaa9d2dc31719564ba2379a445d16e6994bc7adbf9446a2b63d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/amita/Amita-Bold.ttf?raw=true";
      name = "Amita-Bold.ttf";
      sha256 = "2e3db0a183495cc55b81346311bc2c22dde0e4b6599a9f8a7469b5feffdbf0e8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Amita-Regular.ttf $out/share/fonts/truetype/Amita-Regular.ttf
     install -Dm644 Amita-Bold.ttf $out/share/fonts/truetype/Amita-Bold.ttf
  '';

  meta = with lib; {
    description = "Amita";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
