{-# LANGUAGE GeneralizedNewtypeDeriving #-}

data DogueDeBordeaux doge = DogueDeBordeaux doge deriving (Show)

myDoge :: DogueDeBordeaux Int
myDoge = DogueDeBordeaux 1

anotherDoge :: DogueDeBordeaux String
anotherDoge = DogueDeBordeaux "ololo"


data Price = Price Integer deriving (Eq, Show)

data Manufacturer =
				Mini
				| Mazda
				| Tata
				deriving (Eq, Show)

data Airline =	PapuAir
				| CatapultsR'Us
				| TakeYourChancesUnited
				deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
			 | Plane Airline 
			 deriving (Eq, Show)

test = [ Car Mini (Price 1000), Car Tata (Price 500), Plane PapuAir]

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

getManu :: Vehicle -> Manufacturer
getManu (Car m _) = m
getManu _ = error "no Manufacturer"


class TooMany a where
	tooMany :: a -> Bool

instance TooMany Int where
	tooMany n = n > 42

newtype Goats = Goats Int deriving (Eq, Show, TooMany)

