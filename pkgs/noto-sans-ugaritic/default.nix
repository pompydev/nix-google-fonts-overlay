{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-ugaritic-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansugaritic/NotoSansUgaritic-Regular.ttf?raw=true";
      name = "NotoSansUgaritic-Regular.ttf";
      sha256 = "4fe28546a484fbb78df76aa349b99fd73df93bc8e2c486c9906ad0b5e89cb0c8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansUgaritic-Regular.ttf $out/share/fonts/truetype/NotoSansUgaritic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Ugaritic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
