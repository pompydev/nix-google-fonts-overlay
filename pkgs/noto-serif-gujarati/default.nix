{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-gujarati-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifgujarati/NotoSerifGujarati%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifGujarati_wght_.ttf";
      sha256 = "b76ad2086be5faa06a2e0d89e2ff58691d3754d1bb20f9dff0d7b10516c18831";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifGujarati_wght_.ttf $out/share/fonts/truetype/NotoSerifGujarati_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Gujarati";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
