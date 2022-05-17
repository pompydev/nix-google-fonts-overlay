{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "imperial-script-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d4488f009887fe2d6c621929e6cd1494cf1f0fa5/ofl/imperialscript/ImperialScript-Regular.ttf?raw=true";
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
