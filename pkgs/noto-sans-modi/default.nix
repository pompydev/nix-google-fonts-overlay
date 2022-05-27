{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-modi-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmodi/NotoSansModi-Regular.ttf?raw=true";
      name = "NotoSansModi-Regular.ttf";
      sha256 = "54f8107cc084a48aec305329e25487b80887ed873faad3a1eff5e6c1927cbf66";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansModi-Regular.ttf $out/share/fonts/truetype/NotoSansModi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Modi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
