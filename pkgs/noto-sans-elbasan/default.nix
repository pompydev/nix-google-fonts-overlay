{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-elbasan-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanselbasan/NotoSansElbasan-Regular.ttf?raw=true";
      name = "NotoSansElbasan-Regular.ttf";
      sha256 = "6b4e554827154cbead6b00c8b261cdde9453845e33871ff081ad68f58c65166d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansElbasan-Regular.ttf $out/share/fonts/truetype/NotoSansElbasan-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Elbasan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
