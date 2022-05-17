{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "besley-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/85c5cea9da66117723c05bf5d7a7143fd10a411b/ofl/besley/Besley%5Bwght%5D.ttf?raw=true";
      name = "Besley_wght_.ttf";
      sha256 = "71f352d8859c787631a0978161d48497a72caa69dcae6996d6712a564df86c1e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/85c5cea9da66117723c05bf5d7a7143fd10a411b/ofl/besley/Besley-Italic%5Bwght%5D.ttf?raw=true";
      name = "Besley-Italic_wght_.ttf";
      sha256 = "de502a1ab6b06a63982dce8c9e58b3eee8aada175e78d5a4dc0a7b3721f26562";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Besley_wght_.ttf $out/share/fonts/truetype/Besley_wght_.ttf
     install -Dm644 Besley-Italic_wght_.ttf $out/share/fonts/truetype/Besley-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Besley";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
