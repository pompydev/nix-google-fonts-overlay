{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-osmanya-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansosmanya/NotoSansOsmanya-Regular.ttf?raw=true";
      name = "NotoSansOsmanya-Regular.ttf";
      sha256 = "4263abe435e70af98ea372b94d181520bcf6a85f12c2432d2f16448256ceb198";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOsmanya-Regular.ttf $out/share/fonts/truetype/NotoSansOsmanya-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Osmanya";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
