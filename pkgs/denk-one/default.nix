{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "denk-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/denkone/DenkOne-Regular.ttf?raw=true";
      name = "DenkOne-Regular.ttf";
      sha256 = "088761eca739820556435bd4eafb8637808a55e121bed582d493969525c97211";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DenkOne-Regular.ttf $out/share/fonts/truetype/DenkOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Denk One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
