{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sansita-swashed-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e24965e60f784bdfeff869baca4ff94dbb3b542d/ofl/sansitaswashed/SansitaSwashed[wght].ttf?raw=true";
      name = "SansitaSwashed[wght].ttf";
      sha256 = "a6ff6619f22d01eb9582fb00a38052d7afba404ff5868be9bddf37e2888a1c6a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'SansitaSwashed[wght].ttf' $out/share/fonts/truetype/'SansitaSwashed[wght].ttf'
  '';

  meta = with lib; {
    description = "Sansita Swashed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
