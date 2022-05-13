{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lepcha-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanslepcha/NotoSansLepcha-Regular.ttf?raw=true";
      name = "NotoSansLepcha-Regular.ttf";
      sha256 = "168771a2b64da0214bc92d0b93c20f910685b6b4107405fb57ce7ede438fe9d9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLepcha-Regular.ttf $out/share/fonts/truetype/NotoSansLepcha-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Lepcha";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
