import Data.Time
import Data.Maybe (catMaybes)

data DatabaseItem = DbString String 
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = 
  [
    DbDate (UTCTime (fromGregorian 1911 5 1)
                    (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hey dudes"
  , DbDate (UTCTime (fromGregorian 1921 5 1)
                    (secondsToDiffTime 34123))
  , DbNumber 168500
  ]	



filterDate :: DatabaseItem -> Bool
filterDate (DbDate _) = True 
filterDate _ = False

getUtc (DbDate (UTCTime y s)) other = (UTCTime y s) : other
getUtc _ [other] = [other]
getUtc _ _ = []

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = foldr getUtc []

getDate :: DatabaseItem -> Maybe UTCTime
getDate (DbDate t) = Just t
getDate _ = Nothing

getNumber :: DatabaseItem -> Maybe Integer
getNumber (DbNumber i) = Just i
getNumber _ = Nothing

filterDb :: (DatabaseItem -> Maybe a) -> [DatabaseItem] -> [a]
filterDb getter db = catMaybes xs
                     where xs = fmap getter db

-- filterDb getDate theDatabase
-- sum (filterDb getNumber theDatabase) 

stops = "pbtdkg"
vowels = "aeiou"

res = [(s,v) | s <- stops, v <- vowels]


myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\a b ->  f a || b) False

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\ a b -> (f a) : b) []

-- Or we can upgrade it like this myMap f = foldr ((:) . f) []