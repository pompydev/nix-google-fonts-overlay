{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "trocchi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/trocchi/Trocchi-Regular.ttf?raw=true";
      name = "Trocchi-Regular.ttf";
      sha256 = "d2d81d30d99aaa2c234e1d7bb67ee2e9f27f108f8d2ebef1c89e0db623734b91";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Trocchi-Regular.ttf $out/share/fonts/truetype/Trocchi-Regular.ttf
  '';

  meta = with lib; {
    description = "Trocchi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
