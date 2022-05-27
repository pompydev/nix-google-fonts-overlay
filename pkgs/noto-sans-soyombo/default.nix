{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-soyombo-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssoyombo/NotoSansSoyombo-Regular.ttf?raw=true";
      name = "NotoSansSoyombo-Regular.ttf";
      sha256 = "d6cbab7aa7ad154796b62eb3bb125170846e9c8c6eb5560806425377ff36223c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSoyombo-Regular.ttf $out/share/fonts/truetype/NotoSansSoyombo-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Soyombo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
