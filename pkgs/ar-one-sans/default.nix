{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ar-one-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/aronesans/AROneSans%5BARRR,wght%5D.ttf?raw=true";
      name = "AROneSans_ARRR,wght_.ttf";
      sha256 = "235b1352c58fb6d9763d74711d7c2e1d726d805fc04cad8fde2f56a469566b5f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AROneSans_ARRR,wght_.ttf $out/share/fonts/truetype/AROneSans_ARRR,wght_.ttf
  '';

  meta = with lib; {
    description = "AR One Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
