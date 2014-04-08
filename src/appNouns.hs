-- 名詞の列を標準入力から読み取り、文を生成して出力する

module Main where

import System.Random
import Control.Applicative

app :: String -> String -> String
app s1 s2 = s1 ++ "を用いた" ++ s2 ++ "に関する研究"

main = do
  f <- lines <$> getContents
  let max = length f
      num = 20
  gen <- getStdGen
  let lst = (randomRs (0,max-1) gen :: [Int])
  let lst1 = take num $ lst
      lst2 = take num $ drop num (randomRs (0,max-1) gen :: [Int])
      strLst1 = map (\n -> f !! n) lst1
      strLst2 = map (\n -> f !! n) lst2
  mapM_ putStrLn $ zipWith app strLst1 strLst2
