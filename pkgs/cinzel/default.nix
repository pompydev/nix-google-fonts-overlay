{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cinzel-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cinzel/Cinzel%5Bwght%5D.ttf?raw=true";
      name = "Cinzel_wght_.ttf";
      sha256 = "f4d83d34d1f6c741193e4acf4b3dff9531e5a67b6aa65228d00a7db72a4e0f34";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cinzel_wght_.ttf $out/share/fonts/truetype/Cinzel_wght_.ttf
  '';

  meta = with lib; {
    description = "Cinzel";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
