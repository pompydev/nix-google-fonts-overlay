{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-cuneiform-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanscuneiform/NotoSansCuneiform-Regular.ttf?raw=true";
      name = "NotoSansCuneiform-Regular.ttf";
      sha256 = "b4e0a892514fcb1beb081c8b652fb36689f77105491d1796c2c3f5a59b4524d2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCuneiform-Regular.ttf $out/share/fonts/truetype/NotoSansCuneiform-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Cuneiform";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
