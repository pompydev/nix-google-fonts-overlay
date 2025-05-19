{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-khojki-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanskhojki/NotoSansKhojki-Regular.ttf?raw=true";
      name = "NotoSansKhojki-Regular.ttf";
      sha256 = "0b50d1f6d4f8c4254095eb3a9a7603444d9f30e21d8dca1305971288b8e5be1b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKhojki-Regular.ttf $out/share/fonts/truetype/NotoSansKhojki-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Khojki";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
