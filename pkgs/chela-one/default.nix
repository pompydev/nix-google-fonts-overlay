{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chela-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/chelaone/ChelaOne-Regular.ttf?raw=true";
      name = "ChelaOne-Regular.ttf";
      sha256 = "a5633f28945f31a5e494683af2c1f99f9f91c96578bf47dc9c315ebe3050c8f5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ChelaOne-Regular.ttf $out/share/fonts/truetype/ChelaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Chela One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
