{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-glagolitic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansglagolitic/NotoSansGlagolitic-Regular.ttf?raw=true";
      name = "NotoSansGlagolitic-Regular.ttf";
      sha256 = "6472cfa8cda3efd3c680a007af9b55dc02469104a068bf9fd08f934a1fb27310";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGlagolitic-Regular.ttf $out/share/fonts/truetype/NotoSansGlagolitic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Glagolitic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
