{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-newa-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansnewa/NotoSansNewa-Regular.ttf?raw=true";
      name = "NotoSansNewa-Regular.ttf";
      sha256 = "dc8aea050ac05dea01c6a81e6a70d4a7506998a11c6e1ecaaa854b7ff18f9fc6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNewa-Regular.ttf $out/share/fonts/truetype/NotoSansNewa-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Newa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
