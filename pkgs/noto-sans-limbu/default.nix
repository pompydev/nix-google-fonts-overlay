{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-limbu-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanslimbu/NotoSansLimbu-Regular.ttf?raw=true";
      name = "NotoSansLimbu-Regular.ttf";
      sha256 = "5a8b4fd72c5a64051332f66fcf46fda1a32a37d130631362378c6b465d852dd5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLimbu-Regular.ttf $out/share/fonts/truetype/NotoSansLimbu-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Limbu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
