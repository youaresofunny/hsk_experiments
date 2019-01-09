module Jammin where

data Fruit =
    Peach
  | Plum
  | Apple
  | Blackberry
  deriving (Show, Eq, Ord)

data JamJars = Jam { fruit :: Fruit, jars :: Integer } deriving (Show, Eq, Ord)

jams = 
    [
    Jam Peach 100,
    Jam Apple 200,
    Jam Blackberry 50,
    Jam Plum 15
    ]

total :: [JamJars] -> Integer
total = foldr (\a b -> jars a + b) 0 

mostRow :: [JamJars] -> JamJars
mostRow = foldr1 (\a b -> if (jars a) > (jars b) then a else b)
