{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sono/Sono%5BMONO,wght%5D.ttf?raw=true";
      name = "Sono_MONO,wght_.ttf";
      sha256 = "247ca641ca7066e3addc8081d89613c06a79e4276cd4f2164d07a6493530010f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sono_MONO-wght_.ttf $out/share/fonts/truetype/Sono_MONO-wght_.ttf
  '';

  meta = with lib; {
    description = "Sono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
