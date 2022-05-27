{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-warang-citi-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanswarangciti/NotoSansWarangCiti-Regular.ttf?raw=true";
      name = "NotoSansWarangCiti-Regular.ttf";
      sha256 = "4d6dff50fd1e5f45eb643ccfc5f67e69bf9425a5e3cd375ddfd64e96ca8a48fb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansWarangCiti-Regular.ttf $out/share/fonts/truetype/NotoSansWarangCiti-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Warang Citi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
