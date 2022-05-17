{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lora-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/786ec5b83251f471919291ebba2781891d098e6c/ofl/lora/Lora%5Bwght%5D.ttf?raw=true";
      name = "Lora_wght_.ttf";
      sha256 = "a65f70f36e2d2855df08effec06b230a6129919d0a01dbf4865a77430fc9e64a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/786ec5b83251f471919291ebba2781891d098e6c/ofl/lora/Lora-Italic%5Bwght%5D.ttf?raw=true";
      name = "Lora-Italic_wght_.ttf";
      sha256 = "c5a0c8a35e2bf1ab3349110a7d726cbcf1cbe652a55af5c76a3df003958cfee7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lora_wght_.ttf $out/share/fonts/truetype/Lora_wght_.ttf
     install -Dm644 Lora-Italic_wght_.ttf $out/share/fonts/truetype/Lora-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Lora";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
