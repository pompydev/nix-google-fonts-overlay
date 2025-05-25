{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-wancho-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanswancho/NotoSansWancho-Regular.ttf?raw=true";
      name = "NotoSansWancho-Regular.ttf";
      sha256 = "a5cb8b34da1c91b55a789efd79188c103c34dd9d55218d40087afd3850e97f31";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansWancho-Regular.ttf $out/share/fonts/truetype/NotoSansWancho-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Wancho";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
