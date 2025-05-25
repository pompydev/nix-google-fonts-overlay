{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lydian-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanslydian/NotoSansLydian-Regular.ttf?raw=true";
      name = "NotoSansLydian-Regular.ttf";
      sha256 = "25466c3aa089d25abf5829a29c6a72738e006a21865a48e03c58411b0227920a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLydian-Regular.ttf $out/share/fonts/truetype/NotoSansLydian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Lydian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
