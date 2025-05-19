{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fira-code-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/firacode/FiraCode%5Bwght%5D.ttf?raw=true";
      name = "FiraCode_wght_.ttf";
      sha256 = "9335b082b3c7850d98a64b584f3417f65355f3471278bb5eeb8c6c0e8657aeeb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FiraCode_wght_.ttf $out/share/fonts/truetype/FiraCode_wght_.ttf
  '';

  meta = with lib; {
    description = "Fira Code";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
