{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oswald-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7737b61706f8b5de7e6d883f99cb99000ab6cce8/ofl/oswald/Oswald[wght].ttf?raw=true";
      name = "Oswald[wght].ttf";
      sha256 = "08f3f1296114563252ae4fc3ca38dcd432cb461aa32b119a4f49aba7ea8f37cc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Oswald[wght].ttf' $out/share/fonts/truetype/'Oswald[wght].ttf'
  '';

  meta = with lib; {
    description = "Oswald";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
