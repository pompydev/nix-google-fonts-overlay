{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jacquard-12-charted-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/jacquard12charted/Jacquard12Charted-Regular.ttf?raw=true";
      name = "Jacquard12Charted-Regular.ttf";
      sha256 = "b9fa4451af15dc03f08d902378e22eef1c1c07375736ee54b16fee2c170516d2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jacquard12Charted-Regular.ttf $out/share/fonts/truetype/Jacquard12Charted-Regular.ttf
  '';

  meta = with lib; {
    description = "Jacquard 12 Charted";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
