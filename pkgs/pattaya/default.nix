{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pattaya-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/pattaya/Pattaya-Regular.ttf?raw=true";
      name = "Pattaya-Regular.ttf";
      sha256 = "02b77f7f5b52e718a91230c8ea153bfe746e1d748dabded4e41d7e6765fa9889";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Pattaya-Regular.ttf $out/share/fonts/truetype/Pattaya-Regular.ttf
  '';

  meta = with lib; {
    description = "Pattaya";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
