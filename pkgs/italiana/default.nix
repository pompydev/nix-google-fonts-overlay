{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "italiana-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/italiana/Italiana-Regular.ttf?raw=true";
      name = "Italiana-Regular.ttf";
      sha256 = "0ad271d9cd42a57cd5c5fa483ae2406a8138b95acb2a43eb73a8d37b7291fee9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Italiana-Regular.ttf $out/share/fonts/truetype/Italiana-Regular.ttf
  '';

  meta = with lib; {
    description = "Italiana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
