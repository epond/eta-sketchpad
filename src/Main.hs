{-# LANGUAGE MagicHash #-}

module Main where

import Mergesort -- Another Eta module in this project
import Java      -- Module from the Eta standard library that contains the Java monad and related helper functions

foreign import java unsafe "@static java.lang.Integer.max"
  javamax  :: Int -> Int -> Int
foreign import java unsafe "@new" newInteger :: Int -> JInteger

-- Define JWT for java.lang.Integer
data {-# CLASS "java.lang.Integer" #-} JInteger = JInteger (Object# JInteger)
    deriving (Show)

main :: IO ()
main = do
    putStrLn $ "Using another module: " ++ show (mergeSort ([4,9,3,2,3,9,3,2,1] :: [Integer]))
    putStrLn $ "Calling a Java static method: " ++ show (javamax 3 5)
    putStrLn $ "Instantiating a Java class and calling its toString(): " ++ show (newInteger 7)