{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sofia-sans-extra-condensed-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sofiasansextracondensed/SofiaSansExtraCondensed%5Bwght%5D.ttf?raw=true";
      name = "SofiaSansExtraCondensed_wght_.ttf";
      sha256 = "69b42c883ad334def49b044fffa5391358f6b1a668259f18fdcdc0bfe854fc45";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sofiasansextracondensed/SofiaSansExtraCondensed-Italic%5Bwght%5D.ttf?raw=true";
      name = "SofiaSansExtraCondensed-Italic_wght_.ttf";
      sha256 = "442c2c3d9e50229f1cbab4981241e72204c974495aff872296a95e0cb9013f30";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SofiaSansExtraCondensed_wght_.ttf $out/share/fonts/truetype/SofiaSansExtraCondensed_wght_.ttf
     install -Dm644 SofiaSansExtraCondensed-Italic_wght_.ttf $out/share/fonts/truetype/SofiaSansExtraCondensed-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Sofia Sans Extra Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
