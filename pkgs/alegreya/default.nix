{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alegreya-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/alegreya/Alegreya%5Bwght%5D.ttf?raw=true";
      name = "Alegreya_wght_.ttf";
      sha256 = "ba5564634b93a8f8ba57b48cd4f1ae7417d2b4656fbac779028679b00de3cf12";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/alegreya/Alegreya-Italic%5Bwght%5D.ttf?raw=true";
      name = "Alegreya-Italic_wght_.ttf";
      sha256 = "fa915eec76227935dc5fb678953c94b71287c360928013cfdb441dfe52f5a391";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alegreya_wght_.ttf $out/share/fonts/truetype/Alegreya_wght_.ttf
     install -Dm644 Alegreya-Italic_wght_.ttf $out/share/fonts/truetype/Alegreya-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Alegreya";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
