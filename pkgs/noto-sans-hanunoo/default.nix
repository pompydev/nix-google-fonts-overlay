{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-hanunoo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanshanunoo/NotoSansHanunoo-Regular.ttf?raw=true";
      name = "NotoSansHanunoo-Regular.ttf";
      sha256 = "bdf8e293a79d753fcff1c3fdfc5e09fdfd8141cd08dbf2ac1268a24f4549a005";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansHanunoo-Regular.ttf $out/share/fonts/truetype/NotoSansHanunoo-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Hanunoo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
