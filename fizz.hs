fizzBuzz i = if null desc then show i else desc where 
   desc = concat [label | (j,label) <- tags,  rem i j == 0]
   tags = [ (3,"Fizz"), (5,"Buzz"), (7,"Baz") ]
 
main = mapM_ (putStrLn . fizzBuzz) [1..120]