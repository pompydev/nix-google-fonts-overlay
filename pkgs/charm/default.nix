{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "charm-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/charm/Charm-Regular.ttf?raw=true";
      name = "Charm-Regular.ttf";
      sha256 = "daae102e411243377016dbeb8cb9d53087d13074064fe79658afa966a9ac330e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/charm/Charm-Bold.ttf?raw=true";
      name = "Charm-Bold.ttf";
      sha256 = "6e1fa92fda7ab74fcce8ed5d7a9de10a0fb43d777590e8ef9f6931da6e932481";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Charm-Regular.ttf $out/share/fonts/truetype/Charm-Regular.ttf
     install -Dm644 Charm-Bold.ttf $out/share/fonts/truetype/Charm-Bold.ttf
  '';

  meta = with lib; {
    description = "Charm";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
