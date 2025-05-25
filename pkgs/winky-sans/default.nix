{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "winky-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/winkysans/WinkySans%5Bwght%5D.ttf?raw=true";
      name = "WinkySans_wght_.ttf";
      sha256 = "0df4bec6a75fc35f363d0163edd0e660365301dbc0d4bcd71cd916d38ea96135";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/winkysans/WinkySans-Italic%5Bwght%5D.ttf?raw=true";
      name = "WinkySans-Italic_wght_.ttf";
      sha256 = "ead375573ecc189ac280037c75bb96466ca08177af2e648afa7fdd0d9f48a039";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WinkySans_wght_.ttf $out/share/fonts/truetype/WinkySans_wght_.ttf
     install -Dm644 WinkySans-Italic_wght_.ttf $out/share/fonts/truetype/WinkySans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Winky Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
