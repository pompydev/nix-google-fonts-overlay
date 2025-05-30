{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-saurashtra-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanssaurashtra/NotoSansSaurashtra-Regular.ttf?raw=true";
      name = "NotoSansSaurashtra-Regular.ttf";
      sha256 = "d2df88b4e293636d04c363b13dc5c6f88fca0e9a3b6fece52f12c11d77e9e566";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSaurashtra-Regular.ttf $out/share/fonts/truetype/NotoSansSaurashtra-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Saurashtra";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
