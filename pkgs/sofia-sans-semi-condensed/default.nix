{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sofia-sans-semi-condensed-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sofiasanssemicondensed/SofiaSansSemiCondensed%5Bwght%5D.ttf?raw=true";
      name = "SofiaSansSemiCondensed_wght_.ttf";
      sha256 = "7942e1c0b370cb5fe8dbf3584a3f38a913ad84a27e13e74ccd0e547e43d57a1f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sofiasanssemicondensed/SofiaSansSemiCondensed-Italic%5Bwght%5D.ttf?raw=true";
      name = "SofiaSansSemiCondensed-Italic_wght_.ttf";
      sha256 = "ac7f4f8e5cee9c63c722c52e6cb73c97a7894992746e90a0ee8286291e4dfaff";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SofiaSansSemiCondensed_wght_.ttf $out/share/fonts/truetype/SofiaSansSemiCondensed_wght_.ttf
     install -Dm644 SofiaSansSemiCondensed-Italic_wght_.ttf $out/share/fonts/truetype/SofiaSansSemiCondensed-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Sofia Sans Semi Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
