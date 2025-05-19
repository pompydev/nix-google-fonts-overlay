{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kantumruy-pro-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kantumruypro/KantumruyPro%5Bwght%5D.ttf?raw=true";
      name = "KantumruyPro_wght_.ttf";
      sha256 = "613bc1b1ca4e26f5f8ac98d223b76f5ed0cb79e7c3fa6558c2bd6929efe043ae";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kantumruypro/KantumruyPro-Italic%5Bwght%5D.ttf?raw=true";
      name = "KantumruyPro-Italic_wght_.ttf";
      sha256 = "79912e0f9a6c77680bf320633ada1d8a4b01f2e70ed9f26a799223293914d4b0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KantumruyPro_wght_.ttf $out/share/fonts/truetype/KantumruyPro_wght_.ttf
     install -Dm644 KantumruyPro-Italic_wght_.ttf $out/share/fonts/truetype/KantumruyPro-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Kantumruy Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
