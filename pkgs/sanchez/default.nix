{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sanchez-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sanchez/Sanchez-Regular.ttf?raw=true";
      name = "Sanchez-Regular.ttf";
      sha256 = "759e73bad0b78e84555215fd9a68637cf445d41d29e0e9834f5ee9dc43fa7684";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sanchez/Sanchez-Italic.ttf?raw=true";
      name = "Sanchez-Italic.ttf";
      sha256 = "50978369880866e41534bcdb215ebed9b632efae31d434b252a607688bf4bc05";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sanchez-Regular.ttf $out/share/fonts/truetype/Sanchez-Regular.ttf
     install -Dm644 Sanchez-Italic.ttf $out/share/fonts/truetype/Sanchez-Italic.ttf
  '';

  meta = with lib; {
    description = "Sanchez";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
