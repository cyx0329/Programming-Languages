module Lists where

import Prelude

dropN :: Integer -> [a] -> [a]
dropN _ [] = []
dropN 0 (x:xs) = x:xs
dropN n (x:xs) = dropN (n-1) xs

takeN :: Integer -> [a] -> [a]
takeN _ [] = []
takeN 0 (x:xs) = []
takeN n (x:xs) = x: takeN (n-1) xs

dropUntil :: (a -> Bool) -> [a] -> [a]
dropUntil _ [] = []
dropUntil p xs@(x:xs')
	| p x = xs
	| otherwise = dropUntil p xs'