{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "andika-new-basic-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5fcff273324d0e69d3d47eba55aeedb602db59a7/ofl/andikanewbasic/AndikaNewBasic-Regular.ttf?raw=true";
      name = "AndikaNewBasic-Regular.ttf";
      sha256 = "4fb1f3659cc6e95fa754b5e65691ff3d15cb69156a9c072fe25e26b63429d54d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5fcff273324d0e69d3d47eba55aeedb602db59a7/ofl/andikanewbasic/AndikaNewBasic-Italic.ttf?raw=true";
      name = "AndikaNewBasic-Italic.ttf";
      sha256 = "d962ddb879ab9fdae51145f7c4f69a01baa63feb6d092c38775f023f2b58a410";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5fcff273324d0e69d3d47eba55aeedb602db59a7/ofl/andikanewbasic/AndikaNewBasic-Bold.ttf?raw=true";
      name = "AndikaNewBasic-Bold.ttf";
      sha256 = "34cd2bb48d20309bf511e19b55620068bce2fc6142d787665cd782f7707c0cac";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5fcff273324d0e69d3d47eba55aeedb602db59a7/ofl/andikanewbasic/AndikaNewBasic-BoldItalic.ttf?raw=true";
      name = "AndikaNewBasic-BoldItalic.ttf";
      sha256 = "76769ddad1bb87a93dbc1cbc3fdf2cada8fcf9167b5668efcec38a90cbeca60b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AndikaNewBasic-Regular.ttf $out/share/fonts/truetype/AndikaNewBasic-Regular.ttf
     install -Dm644 AndikaNewBasic-Italic.ttf $out/share/fonts/truetype/AndikaNewBasic-Italic.ttf
     install -Dm644 AndikaNewBasic-Bold.ttf $out/share/fonts/truetype/AndikaNewBasic-Bold.ttf
     install -Dm644 AndikaNewBasic-BoldItalic.ttf $out/share/fonts/truetype/AndikaNewBasic-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Andika New Basic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
