{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "batang-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/batang/Batang-Regular.ttf?raw=true";
      name = "Batang-Regular.ttf";
      sha256 = "0929031e799b2feadda22208c58f503515e6f8fa2eaba75acd2e6847d73fc54b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Batang-Regular.ttf $out/share/fonts/truetype/Batang-Regular.ttf
  '';

  meta = with lib; {
    description = "Batang";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
