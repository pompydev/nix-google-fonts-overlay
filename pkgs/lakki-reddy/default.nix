{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lakki-reddy-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lakkireddy/LakkiReddy-Regular.ttf?raw=true";
      name = "LakkiReddy-Regular.ttf";
      sha256 = "f01c5abe775243fd2a7548c2c50178f87b926ffc4c7c6b675775a40931f80a0b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LakkiReddy-Regular.ttf $out/share/fonts/truetype/LakkiReddy-Regular.ttf
  '';

  meta = with lib; {
    description = "Lakki Reddy";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
