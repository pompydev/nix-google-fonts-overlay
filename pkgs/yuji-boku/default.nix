{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yuji-boku-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/yujiboku/YujiBoku-Regular.ttf?raw=true";
      name = "YujiBoku-Regular.ttf";
      sha256 = "94fda16384f3bdac24376a000c57e99abfa314961bd89ef27badfb7410322003";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YujiBoku-Regular.ttf $out/share/fonts/truetype/YujiBoku-Regular.ttf
  '';

  meta = with lib; {
    description = "Yuji Boku";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
