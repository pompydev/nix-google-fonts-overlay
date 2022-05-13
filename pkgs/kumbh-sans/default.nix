{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kumbh-sans-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a96b1ce809acfe0bf73e608a788d3e0221a286e3/ofl/kumbhsans/KumbhSans[wght].ttf?raw=true";
      name = "KumbhSans[wght].ttf";
      sha256 = "7cd32a2184734c6753a6a5ed84257a23a5911c6e415fd0972e9fcef71a767f83";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'KumbhSans[wght].ttf' $out/share/fonts/truetype/'KumbhSans[wght].ttf'
  '';

  meta = with lib; {
    description = "Kumbh Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
