{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-khitan-small-script-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifkhitansmallscript/NotoSerifKhitanSmallScript-Regular.ttf?raw=true";
      name = "NotoSerifKhitanSmallScript-Regular.ttf";
      sha256 = "3e164843a3f04b9f89b533a8cb87141b0ee72661b035a4229cb6f58934d44eba";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifKhitanSmallScript-Regular.ttf $out/share/fonts/truetype/NotoSerifKhitanSmallScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Khitan Small Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
