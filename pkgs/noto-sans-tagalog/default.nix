{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tagalog-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanstagalog/NotoSansTagalog-Regular.ttf?raw=true";
      name = "NotoSansTagalog-Regular.ttf";
      sha256 = "5fe89f89eef4e285575fe1bc5f4340e49cc63a8d43f925bb9af2e78baec6cc96";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTagalog-Regular.ttf $out/share/fonts/truetype/NotoSansTagalog-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tagalog";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
