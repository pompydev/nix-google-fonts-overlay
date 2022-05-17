{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "changa-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5b61d6b493fad7555fc27646a151139f3149366b/ofl/changa/Changa[wght].ttf?raw=true";
      name = "Changa_wght_.ttf";
      sha256 = "7c4f7a14d4b70ac8816ea8df3a0b127aee4c5f5af7239aca2afecc84ddc7f4d3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Changa_wght_.ttf $out/share/fonts/truetype/Changa_wght_.ttf
  '';

  meta = with lib; {
    description = "Changa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
