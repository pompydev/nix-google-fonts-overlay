{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dhyana-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dhyana/Dhyana-Regular.ttf?raw=true";
      name = "Dhyana-Regular.ttf";
      sha256 = "a7b241c509c6f39eebefe649d2e014d2519cd715a12026bb90afb0c3b97c6266";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dhyana/Dhyana-Bold.ttf?raw=true";
      name = "Dhyana-Bold.ttf";
      sha256 = "e2092d37b02d81c24471b8714b3eefb1098e96f80fa658f11284bc0c18b11e8f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dhyana-Regular.ttf $out/share/fonts/truetype/Dhyana-Regular.ttf
     install -Dm644 Dhyana-Bold.ttf $out/share/fonts/truetype/Dhyana-Bold.ttf
  '';

  meta = with lib; {
    description = "Dhyana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
