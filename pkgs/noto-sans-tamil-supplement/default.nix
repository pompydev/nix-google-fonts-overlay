{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tamil-supplement-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanstamilsupplement/NotoSansTamilSupplement-Regular.ttf?raw=true";
      name = "NotoSansTamilSupplement-Regular.ttf";
      sha256 = "321ef3c69cd8b3859420164820f316f245772ab24a587ac35f484a7e18760071";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTamilSupplement-Regular.ttf $out/share/fonts/truetype/NotoSansTamilSupplement-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tamil Supplement";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
