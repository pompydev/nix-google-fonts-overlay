{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yrsa-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/64ee9b109c826fd503bf455ab61206eff9d2177d/ofl/yrsa/Yrsa[wght].ttf?raw=true";
      name = "Yrsa[wght].ttf";
      sha256 = "d853a1fb40e077537a7fd5c447638aa001621fe572d32dd5f633e8e5f58e4e19";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/64ee9b109c826fd503bf455ab61206eff9d2177d/ofl/yrsa/Yrsa-Italic[wght].ttf?raw=true";
      name = "Yrsa-Italic[wght].ttf";
      sha256 = "45ba3f6094da57a30d777804850f4108f0ac6538f6366be6bde38cc1059a3230";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Yrsa[wght].ttf' $out/share/fonts/truetype/'Yrsa[wght].ttf'
     install -Dm644 'Yrsa-Italic[wght].ttf' $out/share/fonts/truetype/'Yrsa-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Yrsa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
