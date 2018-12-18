module Paths_book (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/lopan/.cabal/bin"
libdir     = "/home/lopan/.cabal/lib/x86_64-linux-ghc-7.6.3/book-0.1.0.0"
datadir    = "/home/lopan/.cabal/share/x86_64-linux-ghc-7.6.3/book-0.1.0.0"
libexecdir = "/home/lopan/.cabal/libexec"
sysconfdir = "/home/lopan/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "book_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "book_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "book_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "book_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "book_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
