{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "suranna-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/suranna/Suranna-Regular.ttf?raw=true";
      name = "Suranna-Regular.ttf";
      sha256 = "66ad4194f922e0b230e12d35070c852d38573ad40ad4e993cbe7d69df344b177";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Suranna-Regular.ttf $out/share/fonts/truetype/Suranna-Regular.ttf
  '';

  meta = with lib; {
    description = "Suranna";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
