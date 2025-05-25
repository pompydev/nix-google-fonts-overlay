{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aref-ruqaa-ink-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/arefruqaaink/ArefRuqaaInk-Regular.ttf?raw=true";
      name = "ArefRuqaaInk-Regular.ttf";
      sha256 = "0415c2410b1e453f5d0ea0db114fb95d01f65ba2e9e2dc4ae67c5fb73c33e863";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/arefruqaaink/ArefRuqaaInk-Bold.ttf?raw=true";
      name = "ArefRuqaaInk-Bold.ttf";
      sha256 = "601b5c607e7e20e7957673b92947d35eb87620cd406214037a140695221c31b4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ArefRuqaaInk-Regular.ttf $out/share/fonts/truetype/ArefRuqaaInk-Regular.ttf
     install -Dm644 ArefRuqaaInk-Bold.ttf $out/share/fonts/truetype/ArefRuqaaInk-Bold.ttf
  '';

  meta = with lib; {
    description = "Aref Ruqaa Ink";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
