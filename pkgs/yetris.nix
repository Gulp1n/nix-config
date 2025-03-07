{ stdenv, fetchFromGitHub, ncurses }:

stdenv.mkDerivation {
  pname = "yetris";
  version = "2.3.0";

  src = fetchFromGitHub {
    owner = "alexdantas";
    repo = "yetris";
    rev = "cf3fee6";
    hash = "sha256-YUsUdC29nqUgf/PBLZYXxkoicxj4hU+0crRs5/+f7Ow=";
  };

  buildInputs = [ncurses];

  buildPhase = [
    "make all"
  ];

  installPhase =
    ''mkdir -p $out/bin
    cp bin/yetris $out/bin'';
}