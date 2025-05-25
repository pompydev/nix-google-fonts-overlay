{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "protest-revolution-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/protestrevolution/ProtestRevolution-Regular.ttf?raw=true";
      name = "ProtestRevolution-Regular.ttf";
      sha256 = "5e65722475fe7ea43ce8de724e01767b34edc8362b6738f54d720950fa2bffaa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ProtestRevolution-Regular.ttf $out/share/fonts/truetype/ProtestRevolution-Regular.ttf
  '';

  meta = with lib; {
    description = "Protest Revolution";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
