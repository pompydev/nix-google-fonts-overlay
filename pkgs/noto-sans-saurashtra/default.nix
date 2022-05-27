{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-saurashtra-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssaurashtra/NotoSansSaurashtra-Regular.ttf?raw=true";
      name = "NotoSansSaurashtra-Regular.ttf";
      sha256 = "6b5944253e7a33a9336317de9b73bb8a137e7f7795e9f9f2ef82fc13cc665f5c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSaurashtra-Regular.ttf $out/share/fonts/truetype/NotoSansSaurashtra-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Saurashtra";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
