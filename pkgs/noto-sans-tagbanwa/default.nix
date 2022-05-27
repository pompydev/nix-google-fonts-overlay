{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tagbanwa-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanstagbanwa/NotoSansTagbanwa-Regular.ttf?raw=true";
      name = "NotoSansTagbanwa-Regular.ttf";
      sha256 = "108c5df5e6913a3b68280963b9ed9c43cadee644b3757e2edd6a969374f95c7c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTagbanwa-Regular.ttf $out/share/fonts/truetype/NotoSansTagbanwa-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tagbanwa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
