{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "corinthia-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/corinthia/Corinthia-Regular.ttf?raw=true";
      name = "Corinthia-Regular.ttf";
      sha256 = "ee2adb172a41a52c5f6b7de6de5953bf8e9e6bdfa5bc641fdddbdf4c737fc98e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/corinthia/Corinthia-Bold.ttf?raw=true";
      name = "Corinthia-Bold.ttf";
      sha256 = "86c58bf8f6a7160f9914160fb3c8dfbf75d5b145dd0ab943a0b82913836516f9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Corinthia-Regular.ttf $out/share/fonts/truetype/Corinthia-Regular.ttf
     install -Dm644 Corinthia-Bold.ttf $out/share/fonts/truetype/Corinthia-Bold.ttf
  '';

  meta = with lib; {
    description = "Corinthia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
