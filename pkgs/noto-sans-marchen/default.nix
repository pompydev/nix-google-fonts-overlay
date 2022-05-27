{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-marchen-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmarchen/NotoSansMarchen-Regular.ttf?raw=true";
      name = "NotoSansMarchen-Regular.ttf";
      sha256 = "95bc61fd3fa20fb43aa07047372334dff8db5f6cda9a5ee756784b99da7ec056";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMarchen-Regular.ttf $out/share/fonts/truetype/NotoSansMarchen-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Marchen";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
