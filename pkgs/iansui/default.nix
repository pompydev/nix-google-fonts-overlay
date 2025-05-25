{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "iansui-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/iansui/Iansui-Regular.ttf?raw=true";
      name = "Iansui-Regular.ttf";
      sha256 = "6e6340d80d618a42b48ade9370c34fa37a8210750c6fbc8efe65f23716538a2b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Iansui-Regular.ttf $out/share/fonts/truetype/Iansui-Regular.ttf
  '';

  meta = with lib; {
    description = "Iansui";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
