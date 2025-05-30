{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "abyssinica-sil-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/abyssinicasil/AbyssinicaSIL-Regular.ttf?raw=true";
      name = "AbyssinicaSIL-Regular.ttf";
      sha256 = "f0e4fb92ee26967a3e6462342494956a3798b952345f917e1388913bb191cf2b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AbyssinicaSIL-Regular.ttf $out/share/fonts/truetype/AbyssinicaSIL-Regular.ttf
  '';

  meta = with lib; {
    description = "Abyssinica SIL";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
