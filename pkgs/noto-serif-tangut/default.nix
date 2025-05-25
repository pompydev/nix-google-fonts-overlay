{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-tangut-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoseriftangut/NotoSerifTangut-Regular.ttf?raw=true";
      name = "NotoSerifTangut-Regular.ttf";
      sha256 = "b98f1d3daea708a1c81116542a9371ae560e6ac59d0a4362764417f693b385e3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifTangut-Regular.ttf $out/share/fonts/truetype/NotoSerifTangut-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Tangut";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
