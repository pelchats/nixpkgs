# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, HUnit, testFramework, testFrameworkHunit }:

cabal.mkDerivation (self: {
  pname = "network";
  version = "2.6.0.2";
  sha256 = "12b7saam5ga6l4cplgkad49xa4vkynz2ri9jxidx1cxiqjcl0vc4";
  testDepends = [ HUnit testFramework testFrameworkHunit ];
  meta = {
    homepage = "https://github.com/haskell/network";
    description = "Low-level networking interface";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
