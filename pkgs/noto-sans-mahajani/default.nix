{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mahajani-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansmahajani/NotoSansMahajani-Regular.ttf?raw=true";
      name = "NotoSansMahajani-Regular.ttf";
      sha256 = "a48694e1ea0178e11df1b9a760d7ad53b6aa3a7b86e5d8c18dfb37e144ae69c0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMahajani-Regular.ttf $out/share/fonts/truetype/NotoSansMahajani-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mahajani";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
