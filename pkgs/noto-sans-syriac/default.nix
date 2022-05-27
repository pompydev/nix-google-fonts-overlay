{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-syriac-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssyriac/NotoSansSyriac-Thin.ttf?raw=true";
      name = "NotoSansSyriac-Thin.ttf";
      sha256 = "a2dd1b2a67c526c6d858db9b2db6c55b1ac6b76ab991d1cfc29e93086f49f1f5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssyriac/NotoSansSyriac-Regular.ttf?raw=true";
      name = "NotoSansSyriac-Regular.ttf";
      sha256 = "49917b4472e91dfb37291ef4f4821957f4225edaddb6100b1d8736df3910b237";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssyriac/NotoSansSyriac-Black.ttf?raw=true";
      name = "NotoSansSyriac-Black.ttf";
      sha256 = "d48f1f27a8192aa675a46de3b2e6f6308a8a79e61b2d38c481be8e8a4c0ff571";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSyriac-Thin.ttf $out/share/fonts/truetype/NotoSansSyriac-Thin.ttf
     install -Dm644 NotoSansSyriac-Regular.ttf $out/share/fonts/truetype/NotoSansSyriac-Regular.ttf
     install -Dm644 NotoSansSyriac-Black.ttf $out/share/fonts/truetype/NotoSansSyriac-Black.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Syriac";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
