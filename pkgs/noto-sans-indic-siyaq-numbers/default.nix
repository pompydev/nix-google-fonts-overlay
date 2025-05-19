{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-indic-siyaq-numbers-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansindicsiyaqnumbers/NotoSansIndicSiyaqNumbers-Regular.ttf?raw=true";
      name = "NotoSansIndicSiyaqNumbers-Regular.ttf";
      sha256 = "35045d5e8f0794db6432f4c13bfe123a05183fd2487fba2d0ebfdb76a92a9c33";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansIndicSiyaqNumbers-Regular.ttf $out/share/fonts/truetype/NotoSansIndicSiyaqNumbers-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Indic Siyaq Numbers";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
