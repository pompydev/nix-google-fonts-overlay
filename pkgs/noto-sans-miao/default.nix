{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-miao-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansmiao/NotoSansMiao-Regular.ttf?raw=true";
      name = "NotoSansMiao-Regular.ttf";
      sha256 = "aeb7a17dd44e8e2027d717cec2b14629f82cb741a7d1a6e4b325e99cb69073ab";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMiao-Regular.ttf $out/share/fonts/truetype/NotoSansMiao-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Miao";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
