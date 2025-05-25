{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-elymaic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanselymaic/NotoSansElymaic-Regular.ttf?raw=true";
      name = "NotoSansElymaic-Regular.ttf";
      sha256 = "4a4772cbb8a278019152bafd58fef3892fae055d0b137f3fb1f61663960e156b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansElymaic-Regular.ttf $out/share/fonts/truetype/NotoSansElymaic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Elymaic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
