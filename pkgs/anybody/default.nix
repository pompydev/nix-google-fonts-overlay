{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anybody-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3134d388c0a77e1ebea71cf0ac374fdf7d054b26/ofl/anybody/Anybody[wdth,wght].ttf?raw=true";
      name = "Anybody_wdth,wght_.ttf";
      sha256 = "5ed69aa8c9a947737adb91f4b5f6b448f34725770cdbaec10e8ce7882f085179";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3134d388c0a77e1ebea71cf0ac374fdf7d054b26/ofl/anybody/Anybody-Italic[wdth,wght].ttf?raw=true";
      name = "Anybody-Italic_wdth,wght_.ttf";
      sha256 = "f0ae65b0d4b21de98b4457d6f5767b89d2397bbd0728ec644e7b43e348b656ee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Anybody_wdth,wght_.ttf $out/share/fonts/truetype/Anybody_wdth,wght_.ttf
     install -Dm644 Anybody-Italic_wdth,wght_.ttf $out/share/fonts/truetype/Anybody-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Anybody";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
