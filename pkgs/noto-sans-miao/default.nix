{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-miao-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmiao/NotoSansMiao-Regular.ttf?raw=true";
      name = "NotoSansMiao-Regular.ttf";
      sha256 = "0568835387144b9d03b5b5b3694859766fedd59f7c17b3e1036fa944fc9a9298";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMiao-Regular.ttf $out/share/fonts/truetype/NotoSansMiao-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Miao";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
