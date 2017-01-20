module Main where

import Mergesort -- Another Eta module in this project

foreign import java unsafe "@static java.lang.Integer.max"
  javamax  :: Int -> Int -> Int

main :: IO ()
main = do
    putStrLn $ "Using another module: " ++ show (mergeSort ([4,9,3,2,3,9,3,2,1] :: [Integer]))
    putStrLn $ "Calling a Java static method: " ++ show (javamax 3 5)