{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "work-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/worksans/WorkSans%5Bwght%5D.ttf?raw=true";
      name = "WorkSans_wght_.ttf";
      sha256 = "f50f61f2ba738e239442d40bf1069adb195c224b6a5a73a581fc2f3ed62a9f63";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/worksans/WorkSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "WorkSans-Italic_wght_.ttf";
      sha256 = "0a9f935ea490d3477fc97e40248f356c29bce11a1973939056c4316b122341ec";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WorkSans_wght_.ttf $out/share/fonts/truetype/WorkSans_wght_.ttf
     install -Dm644 WorkSans-Italic_wght_.ttf $out/share/fonts/truetype/WorkSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Work Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
