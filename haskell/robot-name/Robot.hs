module Robot(robotName, mkRobot, resetName) where
  import System.Random
  import Data.Monoid(mappend)
  import Data.IORef (IORef, newIORef, modifyIORef, readIORef)

  mkRobot :: IO (IORef Robot)
  robotName :: IORef Robot -> IO String
  getName :: IO String
  resetName :: IORef Robot -> IO ()

  newtype Robot = Robot { name :: String } deriving(Show)

  robotName rr = fmap name (readIORef rr)

  mkRobot = fmap Robot getName >>= newIORef

  resetName rr = getName >>=
                  \newName -> modifyIORef rr (\r -> r {name = newName})

  getName = do
      g <- newStdGen
      let letters = take 2 (randomRs ('A', 'Z') g)
      let numbers = take 3 (randomRs ('0', '9') g)
      return $ letters `mappend` numbers
