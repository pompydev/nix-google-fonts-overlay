{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "truculenta-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1a2e47430947b139461aee1ed0331866c745f255/ofl/truculenta/Truculenta%5Bopsz,wdth,wght%5D.ttf?raw=true";
      name = "Truculenta_opsz,wdth,wght_.ttf";
      sha256 = "08d8abe8590e3fef246801f86ef1ede30f8c7a000500857024a590529c443f3c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Truculenta_opsz,wdth,wght_.ttf $out/share/fonts/truetype/Truculenta_opsz,wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Truculenta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
