{- Author: Yi Cai -}
{-intersperse function takes a value and a list, and return the list 
in which the value is "interspersed" into the given list.-}

module Intersperse where

import Prelude hiding (intersperse)
{-"_" is any value, "[]" is empty list, "[a]" is a list within 
only one value, "b" is any value, "x" is the head of a list, 
"xs" is the rest of a list.-}

intersperse _ [] = []
intersperse _ [a] = [a]
intersperse b (x:xs)  = x:b :(intersperse b xs)

{- To load this file, type 
     ghci intersperse.hs
   on the command line. Alternatively you can run 
     ghci
   first and then type
     :load intersperse.hs
   at the GHCi prompt. -}