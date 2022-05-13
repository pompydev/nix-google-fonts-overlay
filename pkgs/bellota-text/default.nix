{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bellota-text-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d22365f72284a6af8f644aecbe74a680c55c2014/ofl/bellotatext/BellotaText-Light.ttf?raw=true";
      name = "BellotaText-Light.ttf";
      sha256 = "fdf27404f3b665aa0bdf8b19c7fd425d94ce013ef413945ebbd66b72442575cd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d22365f72284a6af8f644aecbe74a680c55c2014/ofl/bellotatext/BellotaText-LightItalic.ttf?raw=true";
      name = "BellotaText-LightItalic.ttf";
      sha256 = "7b52095b638459458bd7285f5e55651f301511e1a5136db92cb1ed915f8c61a4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d22365f72284a6af8f644aecbe74a680c55c2014/ofl/bellotatext/BellotaText-Regular.ttf?raw=true";
      name = "BellotaText-Regular.ttf";
      sha256 = "b10a58605747b85f738e3bbf9a5571101ecff0a398ef6620df9e9b4ee1f33f83";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d22365f72284a6af8f644aecbe74a680c55c2014/ofl/bellotatext/BellotaText-Italic.ttf?raw=true";
      name = "BellotaText-Italic.ttf";
      sha256 = "4e04943e63ab256026cf2d0e506d16cc6aa7d5d891e63582acc250fc40992bdc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d22365f72284a6af8f644aecbe74a680c55c2014/ofl/bellotatext/BellotaText-Bold.ttf?raw=true";
      name = "BellotaText-Bold.ttf";
      sha256 = "31c41c17d571900437b194300b5a9da384e366e22459d698fabe9f0be4355ef5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d22365f72284a6af8f644aecbe74a680c55c2014/ofl/bellotatext/BellotaText-BoldItalic.ttf?raw=true";
      name = "BellotaText-BoldItalic.ttf";
      sha256 = "2af54d05da4a9512e3a50f9280d5aaf1c9d50f668658d1b2e820682cc53605c8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BellotaText-Light.ttf $out/share/fonts/truetype/BellotaText-Light.ttf
     install -Dm644 BellotaText-LightItalic.ttf $out/share/fonts/truetype/BellotaText-LightItalic.ttf
     install -Dm644 BellotaText-Regular.ttf $out/share/fonts/truetype/BellotaText-Regular.ttf
     install -Dm644 BellotaText-Italic.ttf $out/share/fonts/truetype/BellotaText-Italic.ttf
     install -Dm644 BellotaText-Bold.ttf $out/share/fonts/truetype/BellotaText-Bold.ttf
     install -Dm644 BellotaText-BoldItalic.ttf $out/share/fonts/truetype/BellotaText-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Bellota Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
