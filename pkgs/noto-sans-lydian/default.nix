{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lydian-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanslydian/NotoSansLydian-Regular.ttf?raw=true";
      name = "NotoSansLydian-Regular.ttf";
      sha256 = "a01cc8ef4ce62c34d126a0c68b42944da3f5e45cde8e130056872f293dcab9e1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLydian-Regular.ttf $out/share/fonts/truetype/NotoSansLydian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Lydian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
