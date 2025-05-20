{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sour-gummy-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sourgummy/SourGummy%5Bwdth,wght%5D.ttf?raw=true";
      name = "SourGummy_wdth,wght_.ttf";
      sha256 = "a9a710e4a90795f006b83fcf2ff3e036fc851d32c3c65762228df3c825675fd6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sourgummy/SourGummy-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "SourGummy-Italic_wdth,wght_.ttf";
      sha256 = "04bad20f657e0938b4cafd5bb7e7a8801a3ab10506d53770e9d32a8a5cafbb82";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SourGummy_wdth-wght_.ttf $out/share/fonts/truetype/SourGummy_wdth-wght_.ttf
     install -Dm644 SourGummy-Italic_wdth-wght_.ttf $out/share/fonts/truetype/SourGummy-Italic_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Sour Gummy";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
