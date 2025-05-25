{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-batak-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansbatak/NotoSansBatak-Regular.ttf?raw=true";
      name = "NotoSansBatak-Regular.ttf";
      sha256 = "677f8de17de9290bfe1e5bcd6307fa5a99734d052600ef3aaa50121699247db7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBatak-Regular.ttf $out/share/fonts/truetype/NotoSansBatak-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Batak";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
