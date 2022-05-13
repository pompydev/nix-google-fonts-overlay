{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-vai-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansvai/NotoSansVai-Regular.ttf?raw=true";
      name = "NotoSansVai-Regular.ttf";
      sha256 = "5f58a9c96639c56ea31f85282084dde6d658ede746e3eec64869212fc25a393a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansVai-Regular.ttf $out/share/fonts/truetype/NotoSansVai-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Vai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
