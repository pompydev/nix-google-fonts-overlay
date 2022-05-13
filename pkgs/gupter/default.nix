{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gupter-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/53879c490a9223f481054109e90df63c8565cfca/ofl/gupter/Gupter-Regular.ttf?raw=true";
      name = "Gupter-Regular.ttf";
      sha256 = "cad87b6c06ac63e24f2b9741c0cbe4bcf5945826696f4baca61933c959052cf6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/53879c490a9223f481054109e90df63c8565cfca/ofl/gupter/Gupter-Medium.ttf?raw=true";
      name = "Gupter-Medium.ttf";
      sha256 = "6ca9e0c2fa74cbd2b75a0e69b116218570ac74d80c1e92ebcc59bb6bdc8bb032";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/53879c490a9223f481054109e90df63c8565cfca/ofl/gupter/Gupter-Bold.ttf?raw=true";
      name = "Gupter-Bold.ttf";
      sha256 = "8fab8a84e5a47c4c5a5a4449ca62e3a6492fbddadd778de9d9fb2d3b1b36989c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gupter-Regular.ttf $out/share/fonts/truetype/Gupter-Regular.ttf
     install -Dm644 Gupter-Medium.ttf $out/share/fonts/truetype/Gupter-Medium.ttf
     install -Dm644 Gupter-Bold.ttf $out/share/fonts/truetype/Gupter-Bold.ttf
  '';

  meta = with lib; {
    description = "Gupter";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
