{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "matangi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/matangi/Matangi%5Bwght%5D.ttf?raw=true";
      name = "Matangi_wght_.ttf";
      sha256 = "34efb295364cbafbbef6035bc7b7338fa3b32dda6a9721d053818aa8ae749755";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Matangi_wght_.ttf $out/share/fonts/truetype/Matangi_wght_.ttf
  '';

  meta = with lib; {
    description = "Matangi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
