{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yrsa-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/64ee9b109c826fd503bf455ab61206eff9d2177d/ofl/yrsa/Yrsa%5Bwght%5D.ttf?raw=true";
      name = "Yrsa_wght_.ttf";
      sha256 = "d853a1fb40e077537a7fd5c447638aa001621fe572d32dd5f633e8e5f58e4e19";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/64ee9b109c826fd503bf455ab61206eff9d2177d/ofl/yrsa/Yrsa-Italic%5Bwght%5D.ttf?raw=true";
      name = "Yrsa-Italic_wght_.ttf";
      sha256 = "45ba3f6094da57a30d777804850f4108f0ac6538f6366be6bde38cc1059a3230";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yrsa_wght_.ttf $out/share/fonts/truetype/Yrsa_wght_.ttf
     install -Dm644 Yrsa-Italic_wght_.ttf $out/share/fonts/truetype/Yrsa-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Yrsa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
