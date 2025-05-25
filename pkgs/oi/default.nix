{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/oi/Oi-Regular.ttf?raw=true";
      name = "Oi-Regular.ttf";
      sha256 = "a406eece17ef2416ffefd6f57e4d5272ab2fa226c001ccf6aee7838231175203";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Oi-Regular.ttf $out/share/fonts/truetype/Oi-Regular.ttf
  '';

  meta = with lib; {
    description = "Oi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
