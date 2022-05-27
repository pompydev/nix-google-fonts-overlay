{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sharada-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssharada/NotoSansSharada-Regular.ttf?raw=true";
      name = "NotoSansSharada-Regular.ttf";
      sha256 = "d70fdd4d55beb32020d1fecf38ec9dea8304cec2a3098bdf3da70040cc0b2db7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSharada-Regular.ttf $out/share/fonts/truetype/NotoSansSharada-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Sharada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
