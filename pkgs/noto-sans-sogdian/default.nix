{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sogdian-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssogdian/NotoSansSogdian-Regular.ttf?raw=true";
      name = "NotoSansSogdian-Regular.ttf";
      sha256 = "4a24b96ed2905d7257818e3db02a300a283e909448ccf967efa434e5e45bade8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSogdian-Regular.ttf $out/share/fonts/truetype/NotoSansSogdian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Sogdian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
