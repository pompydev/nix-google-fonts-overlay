{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "share-tech-mono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sharetechmono/ShareTechMono-Regular.ttf?raw=true";
      name = "ShareTechMono-Regular.ttf";
      sha256 = "9ceab1f87414829af259c0f537573ae03ef7dd3147c0b27a36a1a0beb6732677";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ShareTechMono-Regular.ttf $out/share/fonts/truetype/ShareTechMono-Regular.ttf
  '';

  meta = with lib; {
    description = "Share Tech Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
