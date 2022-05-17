{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "eb-garamond-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/177c41e760ce7c766ba001e49be72f0367d6b347/ofl/ebgaramond/EBGaramond[wght].ttf?raw=true";
      name = "EBGaramond_wght_.ttf";
      sha256 = "b7f1dd91643e4f81f60e43fa9c4ba117663a001621913dcfd213706a4d83e6d9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/177c41e760ce7c766ba001e49be72f0367d6b347/ofl/ebgaramond/EBGaramond-Italic[wght].ttf?raw=true";
      name = "EBGaramond-Italic_wght_.ttf";
      sha256 = "3b681621f9c52ef3e013955305009c5d00f85a50c612897a3b4f18bbce490458";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EBGaramond_wght_.ttf $out/share/fonts/truetype/EBGaramond_wght_.ttf
     install -Dm644 EBGaramond-Italic_wght_.ttf $out/share/fonts/truetype/EBGaramond-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "EB Garamond";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
