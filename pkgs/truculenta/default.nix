{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "truculenta-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1a2e47430947b139461aee1ed0331866c745f255/ofl/truculenta/Truculenta[opsz,wdth,wght].ttf?raw=true";
      name = "Truculenta[opsz,wdth,wght].ttf";
      sha256 = "08d8abe8590e3fef246801f86ef1ede30f8c7a000500857024a590529c443f3c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Truculenta[opsz,wdth,wght].ttf' $out/share/fonts/truetype/'Truculenta[opsz,wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Truculenta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
