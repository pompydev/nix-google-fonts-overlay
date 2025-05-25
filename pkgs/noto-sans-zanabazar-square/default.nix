{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-zanabazar-square-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanszanabazarsquare/NotoSansZanabazarSquare-Regular.ttf?raw=true";
      name = "NotoSansZanabazarSquare-Regular.ttf";
      sha256 = "73419252f55ba853edeb9f635533da240ed612b4dff59cdb48d83948864126c7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansZanabazarSquare-Regular.ttf $out/share/fonts/truetype/NotoSansZanabazarSquare-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Zanabazar Square";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
