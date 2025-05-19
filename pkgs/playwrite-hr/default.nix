{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-hr-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritehr/PlaywriteHR%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteHR_wght_.ttf";
      sha256 = "3afb0f3c889585b5f344385e8f2921a04bcecd9835e53832fa6409068c47a805";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteHR_wght_.ttf $out/share/fonts/truetype/PlaywriteHR_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite HR";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
