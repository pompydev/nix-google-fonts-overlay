{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yuji-hentaigana-akari-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/yujihentaiganaakari/YujiHentaiganaAkari-Regular.ttf?raw=true";
      name = "YujiHentaiganaAkari-Regular.ttf";
      sha256 = "6fa6bfaff8851fd20f32a807dfb9a7dc15f54780af564ddc8f32e074004bde27";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YujiHentaiganaAkari-Regular.ttf $out/share/fonts/truetype/YujiHentaiganaAkari-Regular.ttf
  '';

  meta = with lib; {
    description = "Yuji Hentaigana Akari";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
