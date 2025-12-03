module AOC where

type Rotation = Either Int Int

type Model = (Int, Int)

readRotation :: String -> Rotation
readRotation = \case
  ('L':n) -> Left (read n)
  ('R':n) -> Right (read n)
  other   -> error $ "Could not parse rotation: " <> other

rotate :: Model -> Rotation -> Model
rotate (i, z) rotation = case rotation of
  Left n  -> (rotateL n, zeroes (rotateL n))
  Right n -> (rotateR n, zeroes (rotateR n))
  where rotateL n = (i - n) `mod` 100
        rotateR n = (i + n) `mod` 100
        zeroes n  = if n == 0 then z + 1 else z

countZeroes :: Int -> Rotation -> Int
countZeroes i r = case r of
  Right n -> (i + n) `div` 100
  Left n
    | i == 0    -> n `div` 100
    | n < i     -> 0
    | otherwise -> 1 + (n - i) `div` 100

rotate' :: Model -> Rotation -> Model
rotate' (i, z) r = (i', z + countZeroes i r)
  where
    i' = case r of
      Left  n -> (i - n) `mod` 100
      Right n -> (i + n) `mod` 100

f1 :: String -> Int
f1 = snd . foldl' rotate (50, 0) . map readRotation . lines

f2 :: String -> Int
f2 = snd . foldl' rotate' (50, 0) . map readRotation . lines
