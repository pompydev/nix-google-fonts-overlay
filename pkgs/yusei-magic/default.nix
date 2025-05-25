{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yusei-magic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/yuseimagic/YuseiMagic-Regular.ttf?raw=true";
      name = "YuseiMagic-Regular.ttf";
      sha256 = "82098615f39ed9da6a8ccc674b9006e49c70dd5b775a7a1697f6bedd22ce25a2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YuseiMagic-Regular.ttf $out/share/fonts/truetype/YuseiMagic-Regular.ttf
  '';

  meta = with lib; {
    description = "Yusei Magic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
