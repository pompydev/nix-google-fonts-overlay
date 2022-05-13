{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-cherokee-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanscherokee/NotoSansCherokee[wght].ttf?raw=true";
      name = "NotoSansCherokee[wght].ttf";
      sha256 = "f56f38b9997a12495f3b54e72b49e577c0fe092b626c5a08bab0d3f46f9b8354";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansCherokee[wght].ttf' $out/share/fonts/truetype/'NotoSansCherokee[wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Cherokee";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
