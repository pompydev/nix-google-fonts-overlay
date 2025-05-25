{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "do-hyeon-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dohyeon/DoHyeon-Regular.ttf?raw=true";
      name = "DoHyeon-Regular.ttf";
      sha256 = "35644be7f28e0a68a447b1f7af351dcde5674b870f24f7b5f43e26d00b4ab653";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DoHyeon-Regular.ttf $out/share/fonts/truetype/DoHyeon-Regular.ttf
  '';

  meta = with lib; {
    description = "Do Hyeon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
