{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-music-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notomusic/NotoMusic-Regular.ttf?raw=true";
      name = "NotoMusic-Regular.ttf";
      sha256 = "fdf04893f04fabd36261bc5fb4fb2b0ae4da268286318ab8919f34b3e3458397";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoMusic-Regular.ttf $out/share/fonts/truetype/NotoMusic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Music";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
