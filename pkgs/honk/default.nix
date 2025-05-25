{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "honk-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/honk/Honk%5BMORF,SHLN%5D.ttf?raw=true";
      name = "Honk_MORF,SHLN_.ttf";
      sha256 = "7a6c743bb5a8164424d23024efb280bab930abb2bca0f2e9ca2facf6b11d212b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Honk_MORF-SHLN_.ttf $out/share/fonts/truetype/Honk_MORF-SHLN_.ttf
  '';

  meta = with lib; {
    description = "Honk";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
