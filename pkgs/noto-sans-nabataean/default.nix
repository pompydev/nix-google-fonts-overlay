{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-nabataean-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansnabataean/NotoSansNabataean-Regular.ttf?raw=true";
      name = "NotoSansNabataean-Regular.ttf";
      sha256 = "ac17e166ff5d68098dc766be70472fe4d730d56e00066a920ac4944d8c39b8b9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNabataean-Regular.ttf $out/share/fonts/truetype/NotoSansNabataean-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Nabataean";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
