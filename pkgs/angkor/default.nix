{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "angkor-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/angkor/Angkor-Regular.ttf?raw=true";
      name = "Angkor-Regular.ttf";
      sha256 = "ef3a846370cf0a5f6d5718162cb9133a1a9243586f32faf6cdbc449594a3dc1c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Angkor-Regular.ttf $out/share/fonts/truetype/Angkor-Regular.ttf
  '';

  meta = with lib; {
    description = "Angkor";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
