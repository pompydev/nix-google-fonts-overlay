{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-display-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdisplay/NotoSansDisplay%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansDisplay_wdth,wght_.ttf";
      sha256 = "deaa68141fa5ad21bd17d7c11fa79183ceda19b32e40ff5c33874d42f3636dde";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdisplay/NotoSansDisplay-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansDisplay-Italic_wdth,wght_.ttf";
      sha256 = "81374b375e9476e2fa5b31a9ee4bcab524a307270dd5bf033346c7ba932f226b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansDisplay_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansDisplay_wdth,wght_.ttf
     install -Dm644 NotoSansDisplay-Italic_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansDisplay-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
