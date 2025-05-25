{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "carattere-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/carattere/Carattere-Regular.ttf?raw=true";
      name = "Carattere-Regular.ttf";
      sha256 = "2ee075b50a75aeaea0d976d916b535fbcd423a684e97fe8536fd8f9efe905ae6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Carattere-Regular.ttf $out/share/fonts/truetype/Carattere-Regular.ttf
  '';

  meta = with lib; {
    description = "Carattere";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
