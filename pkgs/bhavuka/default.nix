{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bhavuka-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bhavuka/Bhavuka-Regular.ttf?raw=true";
      name = "Bhavuka-Regular.ttf";
      sha256 = "153806257782e9bb99f4504659175a4ba27a5933291702963416c98870b37aa9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bhavuka-Regular.ttf $out/share/fonts/truetype/Bhavuka-Regular.ttf
  '';

  meta = with lib; {
    description = "Bhavuka";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
