{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lohit-bengali-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lohitbengali/Lohit-Bengali.ttf?raw=true";
      name = "Lohit-Bengali.ttf";
      sha256 = "609aefb344d7c7e5b082f7dad501c5479f668896088a93b198675bf6213e8ee1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lohit-Bengali.ttf $out/share/fonts/truetype/Lohit-Bengali.ttf
  '';

  meta = with lib; {
    description = "Lohit Bengali";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
