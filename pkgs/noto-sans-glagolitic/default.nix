{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-glagolitic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansglagolitic/NotoSansGlagolitic-Regular.ttf?raw=true";
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
