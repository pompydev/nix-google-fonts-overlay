{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-linear-a-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanslineara/NotoSansLinearA-Regular.ttf?raw=true";
      name = "NotoSansLinearA-Regular.ttf";
      sha256 = "f2f281d2bfd685ed2fb9597d77ed50dbe64bc36e0e80acf88b0862f2561e5aa0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLinearA-Regular.ttf $out/share/fonts/truetype/NotoSansLinearA-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Linear A";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
