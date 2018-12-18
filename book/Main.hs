(+++) :: [a] => [a] => [a]
lst1 +++ lst2 = if null lst1
				then lst2
				else (head lst1) : (tail lst1 +++ lst2)


reverse2 :: [a] => [a]
reverse2 list = if null list
		   then []
		   else reverse2 (tail list) +++ [head list]


maxmin :: Ord a => [a] => (a, a)
maxmin list = let h = head list
			  in if null (tail list)
			  	 then (h, h)
			  	 else 
			  	 	( if h > t_max then h else t_max
			  	 	, if h < t_min then h else t_min )
			  	 	where 
			  	 	  	t = maxmin (tail list)
			  	 	  	t_max = fst t
			  	 	  	t_min = snd t

maxmin2 :: Ord a => [a] => (a, a)
maxmin2 [x] = (x, x)
maxmin2 (x:xs) = ( if x > xs_max then x else xs_max,
				   if x < xs_min then x else xs_min
				 ) where (xs_max, xs_min) = maxmin2 xs




data TimeMachine = TimeMachine { manufacturer :: String, model :: Integer, title :: String, price :: Float }
				   deriving Show


defaultMachine :: TimeMachine
defaultMachine = TimeMachine { manufacturer = "", model = 0, title = "default", price = 0 }

getDiscounted :: TimeMachine -> TimeMachine
getDiscounted m@(TimeMachine { price = p }) = let discountPrice = p - p * 0.1
								 in m { price = discountPrice }

getDiscounts :: [TimeMachine] -> [TimeMachine]
getDiscounts [] = []
getDiscounts [machine] = [getDiscounted machine]
getDiscounts (machine:machines) = (getDiscounted machine) : (getDiscounts machines)

getAllDiscounts list = map getDiscounted list

discounts = getAllDiscounts [
				(TimeMachine { manufacturer = "bosh", model = 1, title="first", price=100}), 
				(TimeMachine { manufacturer = "sharp", model = 1234, title="second", price=1000})
			]



data Client = GovOrg String
			| Company String Integer String String
			| Individual String String Bool
			deriving Show


data Person = Person { firstname :: String, lastname :: String, gender :: Gender }
			  deriving Show
data Gender = Male | Female | Unknown
			  deriving Show


getGender :: Person -> Gender
getGender (Person _ _ gender) = gender

malesCount :: [Person] -> Integer -> Integer
malesCount list cnt = case list of
					[] -> cnt
					person:persons ->
						case getGender person of 
							Male -> malesCount persons (cnt + 1)
							_ -> malesCount persons cnt



main = print (maxmin [420..610])