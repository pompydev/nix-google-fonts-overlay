{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-nushu-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansnushu/NotoSansNushu-Regular.ttf?raw=true";
      name = "NotoSansNushu-Regular.ttf";
      sha256 = "dc9cd53e71e2ecfb749b6a824bf779c88af840b9f9bdd22db51246fc6b9fca2d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNushu-Regular.ttf $out/share/fonts/truetype/NotoSansNushu-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Nushu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
