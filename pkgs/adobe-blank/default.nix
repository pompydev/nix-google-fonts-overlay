{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "adobe-blank-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/adobeblank/AdobeBlank-Regular.ttf?raw=true";
      name = "AdobeBlank-Regular.ttf";
      sha256 = "3b468f6efabe9274e804edf10477c8bdaf27cb2a76f50a5dd7cca34599f8b918";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AdobeBlank-Regular.ttf $out/share/fonts/truetype/AdobeBlank-Regular.ttf
  '';

  meta = with lib; {
    description = "Adobe Blank";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
