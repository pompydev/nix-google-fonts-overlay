{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stix-two-text-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9017368e541f77a66e2302f474d2142d1bb77f5c/ofl/stixtwotext/STIXTwoText[wght].ttf?raw=true";
      name = "STIXTwoText[wght].ttf";
      sha256 = "7962b8b7811e6a896c9a91a0bccbb5241047770eb24d4997c5cb5fe21d5c0df2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9017368e541f77a66e2302f474d2142d1bb77f5c/ofl/stixtwotext/STIXTwoText-Italic[wght].ttf?raw=true";
      name = "STIXTwoText-Italic[wght].ttf";
      sha256 = "88c0e2e316eaff56eddc9e51e4850317e2a1e490bbf758b2dec4793aedba9c74";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'STIXTwoText[wght].ttf' $out/share/fonts/truetype/'STIXTwoText[wght].ttf'
     install -Dm644 'STIXTwoText-Italic[wght].ttf' $out/share/fonts/truetype/'STIXTwoText-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "STIX Two Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
