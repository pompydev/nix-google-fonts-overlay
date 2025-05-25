{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "karla-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/karla/Karla%5Bwght%5D.ttf?raw=true";
      name = "Karla_wght_.ttf";
      sha256 = "ed3ca4cd9bdd899c543927c30bf5ff50706b24b3f2b7328e64b25f7d2a9d23dc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/karla/Karla-Italic%5Bwght%5D.ttf?raw=true";
      name = "Karla-Italic_wght_.ttf";
      sha256 = "98c02551288197a43d9c7e62c105f4b6f283a57f0f06d623313ea32d5c701977";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Karla_wght_.ttf $out/share/fonts/truetype/Karla_wght_.ttf
     install -Dm644 Karla-Italic_wght_.ttf $out/share/fonts/truetype/Karla-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Karla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
