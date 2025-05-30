{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lisu-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanslisu/NotoSansLisu%5Bwght%5D.ttf?raw=true";
      name = "NotoSansLisu_wght_.ttf";
      sha256 = "669592efd358c495000ae79201dbec736d877d04fabf4dfc4dfb887cd9eeac40";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLisu_wght_.ttf $out/share/fonts/truetype/NotoSansLisu_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Lisu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
