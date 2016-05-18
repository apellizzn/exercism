module BankAccount
    (
      BankAccount(..),
      openAccount,
      closeAccount,
      getBalance,
      incrementBalance
    ) where

    import Control.Concurrent.STM (TVar, atomically, modifyTVar, newTVarIO, readTVarIO, writeTVar)

    data BankAccount = BankAccount {balance :: TVar (Maybe Integer)}

    openAccount :: IO BankAccount
    openAccount = do
      initialBalance <- newTVarIO (Just 0)
      return $ BankAccount initialBalance

    closeAccount :: BankAccount -> IO ()
    closeAccount acc = atomically $ writeTVar (balance acc) Nothing

    getBalance :: BankAccount -> IO (Maybe Integer)
    getBalance = readTVarIO . balance

    incrementBalance :: BankAccount -> Integer -> IO (Maybe Integer)
    incrementBalance account amount = do
      atomically $ modifyTVar (balance account) (fmap (+ amount))
      getBalance account
