{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "irish-grover-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/irishgrover/IrishGrover-Regular.ttf?raw=true";
      name = "IrishGrover-Regular.ttf";
      sha256 = "d894be4e904bbd08a9d46670b4f631e84b7de5d70ede2c89e8217958ca32eec4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IrishGrover-Regular.ttf $out/share/fonts/truetype/IrishGrover-Regular.ttf
  '';

  meta = with lib; {
    description = "Irish Grover";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
