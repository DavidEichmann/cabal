module PackageTests.CMain.Check
       ( checkBuild
       ) where

import Test.HUnit
import System.FilePath
import PackageTests.PackageTester

dir :: FilePath
dir = "PackageTests" </> "CMain"

checkBuild :: FilePath -> Test
checkBuild ghcPath = TestCase $ do
    let spec = PackageSpec
            { directory = dir
            , distPref = Nothing
            , configOpts = []
            }
    buildResult <- cabal_build spec ghcPath
    assertBuildSucceeded buildResult
