{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kantumruy-pro-${version}";
  version = "2022-05-12-103441";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bbc4168004b6d8255d3ea176d4595712279b67ea/ofl/kantumruypro/KantumruyPro[wght].ttf?raw=true";
      name = "KantumruyPro_wght_.ttf";
      sha256 = "104129b14d55bc2ac86d495bd2a8ea0666cd359a39f2f6bad4791cba161fce9b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bbc4168004b6d8255d3ea176d4595712279b67ea/ofl/kantumruypro/KantumruyPro-Italic[wght].ttf?raw=true";
      name = "KantumruyPro-Italic_wght_.ttf";
      sha256 = "0ab262cc1ae8488eb642b7995c7b83d9e0652d52ea2da127e174408338b29254";
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
