{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sora-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sora/Sora%5Bwght%5D.ttf?raw=true";
      name = "Sora_wght_.ttf";
      sha256 = "84ff7096ae3ec6c8be47d906d1a0ba4de7f2ce78c615275c77301964a316e16c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sora_wght_.ttf $out/share/fonts/truetype/Sora_wght_.ttf
  '';

  meta = with lib; {
    description = "Sora";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
