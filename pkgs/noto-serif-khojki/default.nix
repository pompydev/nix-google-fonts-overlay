{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-khojki-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifkhojki/NotoSerifKhojki%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifKhojki_wght_.ttf";
      sha256 = "d3d89a3fbf6ed2bd0761481332c2a6ab06db4f0500d3775accd94d31829697a0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifKhojki_wght_.ttf $out/share/fonts/truetype/NotoSerifKhojki_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Khojki";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
