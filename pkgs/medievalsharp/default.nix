{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "medievalsharp-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/medievalsharp/MedievalSharp.ttf?raw=true";
      name = "MedievalSharp.ttf";
      sha256 = "74cb2e6738bd7703adf120802f68fba0c9ddb9147a08e6847f1005b1e55df5a5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MedievalSharp.ttf $out/share/fonts/truetype/MedievalSharp.ttf
  '';

  meta = with lib; {
    description = "MedievalSharp";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
