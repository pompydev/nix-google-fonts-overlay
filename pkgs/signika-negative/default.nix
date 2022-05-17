{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "signika-negative-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/359c4c4749175df8fba498bffd510322523051db/ofl/signikanegative/SignikaNegative[wght].ttf?raw=true";
      name = "SignikaNegative_wght_.ttf";
      sha256 = "2d111b1f760fdf84739371f11c88d47d47f642ad643039d3e639466606a5cdec";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SignikaNegative_wght_.ttf $out/share/fonts/truetype/SignikaNegative_wght_.ttf
  '';

  meta = with lib; {
    description = "Signika Negative";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
