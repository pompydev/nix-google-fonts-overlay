{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rosario-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5f70e9b1d82fee698eb0d78df979cd328f610d90/ofl/rosario/Rosario%5Bwght%5D.ttf?raw=true";
      name = "Rosario_wght_.ttf";
      sha256 = "ebeaaae45c8840f5054dc4bfca2101bed3d744b40368597cd6877980f21bfe48";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5f70e9b1d82fee698eb0d78df979cd328f610d90/ofl/rosario/Rosario-Italic%5Bwght%5D.ttf?raw=true";
      name = "Rosario-Italic_wght_.ttf";
      sha256 = "42a418a5472e60671432d8981f8deffd4090706a941a33a87e077c703e9304c5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rosario_wght_.ttf $out/share/fonts/truetype/Rosario_wght_.ttf
     install -Dm644 Rosario-Italic_wght_.ttf $out/share/fonts/truetype/Rosario-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Rosario";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
