{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ovo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ovo/Ovo-Regular.ttf?raw=true";
      name = "Ovo-Regular.ttf";
      sha256 = "8d4f113ada748f44d005371bee5692e58950a84e6068b74f54710e280a29f389";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ovo-Regular.ttf $out/share/fonts/truetype/Ovo-Regular.ttf
  '';

  meta = with lib; {
    description = "Ovo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
