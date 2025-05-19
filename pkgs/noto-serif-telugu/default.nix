{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-telugu-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoseriftelugu/NotoSerifTelugu%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifTelugu_wght_.ttf";
      sha256 = "32210d8d514d9aad43bf927fbd47c7e3066ee6a20c0258678f2ee45915012a26";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifTelugu_wght_.ttf $out/share/fonts/truetype/NotoSerifTelugu_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Telugu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
