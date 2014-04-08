module Main where

import Control.Applicative
import Data.List

removeAst :: [String] -> [String]
removeAst [] = []
removeAst (x:xs) =  hd : (removeAst $ dropWhile (\str -> not $ "*" `isPrefixOf` str) xs)
  where hd = concat $ (takeWhile (\str -> not $ "*" `isPrefixOf` str) xs)

main = do
  lst <- lines <$> getContents
  mapM_ putStrLn $ removeAst lst
