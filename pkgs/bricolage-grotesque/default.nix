{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bricolage-grotesque-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bricolagegrotesque/BricolageGrotesque%5Bopsz,wdth,wght%5D.ttf?raw=true";
      name = "BricolageGrotesque_opsz,wdth,wght_.ttf";
      sha256 = "413e7357809ddd12fd80a96a8a396de0e401638d4acd3cb3e37532f0472ac682";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BricolageGrotesque_opsz,wdth,wght_.ttf $out/share/fonts/truetype/BricolageGrotesque_opsz,wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Bricolage Grotesque";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
