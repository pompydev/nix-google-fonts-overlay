{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-ogham-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansogham/NotoSansOgham-Regular.ttf?raw=true";
      name = "NotoSansOgham-Regular.ttf";
      sha256 = "0656e8c6a1adeedba26a04cd3537072924c5e114b5743e211e1e5e52fbddcedb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOgham-Regular.ttf $out/share/fonts/truetype/NotoSansOgham-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Ogham";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
