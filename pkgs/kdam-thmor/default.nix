{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kdam-thmor-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9cb4270d0cd240f7fe58129f150a9351e60c4d5e/ofl/kdamthmor/KdamThmor-Regular.ttf?raw=true";
      name = "KdamThmor-Regular.ttf";
      sha256 = "ffc874f2f8988b4b3e7d04dc9ebbd7bb99a38f701df20cf06ebfb451c48cdd7e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KdamThmor-Regular.ttf $out/share/fonts/truetype/KdamThmor-Regular.ttf
  '';

  meta = with lib; {
    description = "Kdam Thmor";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
