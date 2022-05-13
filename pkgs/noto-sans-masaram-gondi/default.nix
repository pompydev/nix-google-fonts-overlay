{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-masaram-gondi-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmasaramgondi/NotoSansMasaramGondi-Regular.ttf?raw=true";
      name = "NotoSansMasaramGondi-Regular.ttf";
      sha256 = "58fea17ae8fb1d51f647e20d0246ede2b0abca1917f9121a1451488a2295765c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMasaramGondi-Regular.ttf $out/share/fonts/truetype/NotoSansMasaramGondi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Masaram Gondi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
