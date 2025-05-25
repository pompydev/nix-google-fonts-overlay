{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-marchen-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansmarchen/NotoSansMarchen-Regular.ttf?raw=true";
      name = "NotoSansMarchen-Regular.ttf";
      sha256 = "6c8ecfbf4e0b5926ebee810be293c1018f921577b2f6dff22e19ec0a596c7ce3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMarchen-Regular.ttf $out/share/fonts/truetype/NotoSansMarchen-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Marchen";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
