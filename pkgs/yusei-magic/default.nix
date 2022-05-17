{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yusei-magic-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f58dfb9001f31a5eb15b4960b9548b8fd0fa6168/ofl/yuseimagic/YuseiMagic-Regular.ttf?raw=true";
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
