{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-permic-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansoldpermic/NotoSansOldPermic-Regular.ttf?raw=true";
      name = "NotoSansOldPermic-Regular.ttf";
      sha256 = "752d2519d4bbc1f961f2f79f2896267e18f5775531fa01718d67c1d2ecbb7f12";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldPermic-Regular.ttf $out/share/fonts/truetype/NotoSansOldPermic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old Permic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
