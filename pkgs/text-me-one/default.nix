{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "text-me-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/textmeone/TextMeOne-Regular.ttf?raw=true";
      name = "TextMeOne-Regular.ttf";
      sha256 = "9fe85023985715c05af121a2a76431ca651ab77e25e32d8fb3079c5f23818849";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TextMeOne-Regular.ttf $out/share/fonts/truetype/TextMeOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Text Me One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
