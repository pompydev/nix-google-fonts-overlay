{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-chettan-2-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/164f84fea7f2a61dc501b32686e60cca9d029e08/ofl/baloochettan2/BalooChettan2[wght].ttf?raw=true";
      name = "BalooChettan2_wght_.ttf";
      sha256 = "8f0de4f81b40d314a129c55a3a9e58411868ca9a452edb57537488853f46db86";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooChettan2_wght_.ttf $out/share/fonts/truetype/BalooChettan2_wght_.ttf
  '';

  meta = with lib; {
    description = "Baloo Chettan 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
