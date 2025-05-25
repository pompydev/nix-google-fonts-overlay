{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-gothic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansgothic/NotoSansGothic-Regular.ttf?raw=true";
      name = "NotoSansGothic-Regular.ttf";
      sha256 = "5a1b3946cc98fd9ccd8d3b32777cdaa82ae7f0278469d18272e1d9fcf2f6ff87";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGothic-Regular.ttf $out/share/fonts/truetype/NotoSansGothic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Gothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
