{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-makasar-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifmakasar/NotoSerifMakasar-Regular.ttf?raw=true";
      name = "NotoSerifMakasar-Regular.ttf";
      sha256 = "f4c5619563060fb67fc9ef26e755ee8a9d4a27ba22e2938f25ffcd1e2b547f94";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifMakasar-Regular.ttf $out/share/fonts/truetype/NotoSerifMakasar-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Makasar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
