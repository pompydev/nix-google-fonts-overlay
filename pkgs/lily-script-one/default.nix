{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lily-script-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lilyscriptone/LilyScriptOne-Regular.ttf?raw=true";
      name = "LilyScriptOne-Regular.ttf";
      sha256 = "191c8e3bfd653ae020cf23cd5b4c5a6a2de7412464a290e51461dd084aa62765";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LilyScriptOne-Regular.ttf $out/share/fonts/truetype/LilyScriptOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Lily Script One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
