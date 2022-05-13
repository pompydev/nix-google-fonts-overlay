{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cinzel-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/45071f07c63e863a539442ef3562b71ab1f147a6/ofl/cinzel/Cinzel[wght].ttf?raw=true";
      name = "Cinzel[wght].ttf";
      sha256 = "f4d83d34d1f6c741193e4acf4b3dff9531e5a67b6aa65228d00a7db72a4e0f34";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Cinzel[wght].ttf' $out/share/fonts/truetype/'Cinzel[wght].ttf'
  '';

  meta = with lib; {
    description = "Cinzel";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
