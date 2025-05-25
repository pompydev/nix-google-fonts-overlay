{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "share-tech-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sharetech/ShareTech-Regular.ttf?raw=true";
      name = "ShareTech-Regular.ttf";
      sha256 = "2d1dc42631c22ce99285a3a7c1d0ca9e0bae9e67aa1ca01a501081f27a203df4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ShareTech-Regular.ttf $out/share/fonts/truetype/ShareTech-Regular.ttf
  '';

  meta = with lib; {
    description = "Share Tech";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
