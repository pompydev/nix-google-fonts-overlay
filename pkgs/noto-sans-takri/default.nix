{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-takri-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanstakri/NotoSansTakri-Regular.ttf?raw=true";
      name = "NotoSansTakri-Regular.ttf";
      sha256 = "129764150a358e24eb65ec117d140440e84b28bf4aad23a608fe9526f10c4701";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTakri-Regular.ttf $out/share/fonts/truetype/NotoSansTakri-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Takri";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
