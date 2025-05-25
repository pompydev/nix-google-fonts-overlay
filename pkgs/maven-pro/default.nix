{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "maven-pro-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mavenpro/MavenPro%5Bwght%5D.ttf?raw=true";
      name = "MavenPro_wght_.ttf";
      sha256 = "bc994ed80baaec6ea61d7cb631f49466a1deb29d4363138021a96931f9faae9a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MavenPro_wght_.ttf $out/share/fonts/truetype/MavenPro_wght_.ttf
  '';

  meta = with lib; {
    description = "Maven Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
