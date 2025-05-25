{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jomhuria-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/jomhuria/Jomhuria-Regular.ttf?raw=true";
      name = "Jomhuria-Regular.ttf";
      sha256 = "17b4b0453acdaafb940a8be8acccc968713e223e5d03942347f6562ca3b1dec3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jomhuria-Regular.ttf $out/share/fonts/truetype/Jomhuria-Regular.ttf
  '';

  meta = with lib; {
    description = "Jomhuria";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
