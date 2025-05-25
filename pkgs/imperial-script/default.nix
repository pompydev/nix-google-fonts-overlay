{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "imperial-script-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/imperialscript/ImperialScript-Regular.ttf?raw=true";
      name = "ImperialScript-Regular.ttf";
      sha256 = "fa040ae596cde82559c3bcf056ac216a94efa904b848382ab85740d38df4bab7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ImperialScript-Regular.ttf $out/share/fonts/truetype/ImperialScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Imperial Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
