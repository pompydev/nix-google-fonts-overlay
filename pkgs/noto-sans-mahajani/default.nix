{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mahajani-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmahajani/NotoSansMahajani-Regular.ttf?raw=true";
      name = "NotoSansMahajani-Regular.ttf";
      sha256 = "14602358186a2361d57707105b9ea35ac90ff235598f2a890cfa65bef1634958";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMahajani-Regular.ttf $out/share/fonts/truetype/NotoSansMahajani-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mahajani";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
