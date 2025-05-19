{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-adlam-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansadlam/NotoSansAdlam%5Bwght%5D.ttf?raw=true";
      name = "NotoSansAdlam_wght_.ttf";
      sha256 = "fda98eedbbad51d6c80319065bb193a1b3c9410a8309f09063082b768a54159f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansAdlam_wght_.ttf $out/share/fonts/truetype/NotoSansAdlam_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Adlam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
