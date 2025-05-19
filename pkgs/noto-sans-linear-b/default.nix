{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-linear-b-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanslinearb/NotoSansLinearB-Regular.ttf?raw=true";
      name = "NotoSansLinearB-Regular.ttf";
      sha256 = "c69e7a80ad643b7f05fea03bf4102a659489b045533f6ac5539c3600c98fdb06";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLinearB-Regular.ttf $out/share/fonts/truetype/NotoSansLinearB-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Linear B";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
