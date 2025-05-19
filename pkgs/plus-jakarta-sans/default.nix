{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "plus-jakarta-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/plusjakartasans/PlusJakartaSans%5Bwght%5D.ttf?raw=true";
      name = "PlusJakartaSans_wght_.ttf";
      sha256 = "89b3fb38aa0d275d7a731d0d817a4f1622b316b4d7fbdedcf02ee9099ff68bc8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/plusjakartasans/PlusJakartaSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "PlusJakartaSans-Italic_wght_.ttf";
      sha256 = "9529eb888668b6a3c6dd75b6341a2fc5263fb6c9e788822e6117c29dd9e8b115";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlusJakartaSans_wght_.ttf $out/share/fonts/truetype/PlusJakartaSans_wght_.ttf
     install -Dm644 PlusJakartaSans-Italic_wght_.ttf $out/share/fonts/truetype/PlusJakartaSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Plus Jakarta Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
