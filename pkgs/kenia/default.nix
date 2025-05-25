{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kenia-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kenia/Kenia-Regular.ttf?raw=true";
      name = "Kenia-Regular.ttf";
      sha256 = "4052e03cdabd35ef9f739fdf1462b1b26c16b2238ba27223238624a2bb5565b9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kenia-Regular.ttf $out/share/fonts/truetype/Kenia-Regular.ttf
  '';

  meta = with lib; {
    description = "Kenia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
