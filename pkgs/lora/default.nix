{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lora-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/lora/Lora%5Bwght%5D.ttf?raw=true";
      name = "Lora_wght_.ttf";
      sha256 = "822a6621ccbe8d97d20ac88c1c41f5615c9c2c202eaa75f272cd452aac6475a7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/lora/Lora-Italic%5Bwght%5D.ttf?raw=true";
      name = "Lora-Italic_wght_.ttf";
      sha256 = "22d8d8854b53807aa664ca34f2031a9ed57a1d0dea296b8b96cdd3aad937a2b3";
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
