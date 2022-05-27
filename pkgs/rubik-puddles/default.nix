{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-puddles-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/210ebc8df7fc052109c4b273a602ff5a6cc80980/ofl/rubikpuddles/RubikPuddles-Regular.ttf?raw=true";
      name = "RubikPuddles-Regular.ttf";
      sha256 = "ac690b0790b890a24c54997cfc66bde14d4648cb1a914e9b8754e9023bb0d342";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikPuddles-Regular.ttf $out/share/fonts/truetype/RubikPuddles-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Puddles";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
