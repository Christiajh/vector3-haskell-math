
--definisi type
data Vector3 = Vector3 { x :: Double, y :: Double, z :: Double} deriving Show

--Realisasi Selektor
getX :: Vector3 -> Double
getX vector3 = x vector3

getY :: Vector3 -> Double
getY vector3 = y vector3

getZ :: Vector3 -> Double
getZ vector3 = z vector3

--Realisasi Konstruktor
makeVector3 :: Double -> Double -> Double -> Vector3
makeVector3 x y z = Vector3 { x = x, y = y, z = z }

--Realisasi Predikat
isOrigin :: Vector3 -> Bool
isOrigin vektor = 
    if getX vektor == 0.0 && getY vektor == 0.0 && getZ vektor == 0.0
        then True
        else False

isRight :: Vector3 -> Bool
isRight vektor 
    | getX vektor == 1.0 && getY vektor == 0.0 && getZ vektor == 0.0 = True
    | otherwise = False

isUp :: Vector3 -> Bool
isUp vektor =
    if getX vektor == 0.0 && getY vektor == 1.0 && getZ vektor == 0.0
        then True
        else False

isForward :: Vector3 -> Bool
isForward vektor 
    | getX vektor == 0.0 && getY vektor == 0.0 && getZ vektor == 1.0 = True
    | otherwise = False

isOne :: Vector3 -> Bool
isOne vektor =
    if getX vektor == 1.0 && getY vektor == 1.0 && getZ vektor == 1.0
        then True
        else False

isLeft :: Vector3 -> Bool
isLeft vektor 
    | getX vektor == -1.0 && getY vektor == 0.0 && getZ vektor == 0.0 = True
    | otherwise = False

isDown :: Vector3 -> Bool
isDown vektor =
    if getX vektor == 0.0 && getY vektor == -1.0 && getZ vektor == 0.0
        then True
        else False

isBack :: Vector3 -> Bool
isBack vektor 
    | getX vektor == 0.0 && getY vektor == 0.0 && getZ vektor == -1.0 = True
    | otherwise = False

isEquals :: Vector3 -> Vector3 -> Bool
isEquals vektor1 vektor2 =
    if getX vektor1 == getX vektor2 && getY vektor1 == getY vektor2 && getZ vektor1 == getZ vektor2
        then True
        else False

isNotEquals :: Vector3 -> Vector3 -> Bool
isNotEquals vektor1 vektor2 
    | getX vektor1 /= getX vektor2 || getY vektor1 /= getY vektor2 || getZ vektor1 /= getZ vektor2 = True
    | otherwise = False

--Realisasi Operator
vectorMax :: Vector3 -> Vector3 -> Vector3
vectorMax vektor1 vektor2 =
    let maxX = if getX vektor1 > getX vektor2 then getX vektor1 else getX vektor2
        maxY = if getY vektor1 > getY vektor2 then getY vektor1 else getY vektor2
        maxZ = if getZ vektor1 > getZ vektor2 then getZ vektor1 else getZ vektor2

    in Vector3 { x = maxX, y = maxY, z = maxZ }

vectorMin :: Vector3 -> Vector3 -> Vector3
vectorMin vektor1 vektor2 =
    let minX = if getX vektor1 < getX vektor2 then getX vektor1 else getX vektor2
        minY = if getY vektor1 < getY vektor2 then getY vektor1 else getY vektor2
        minZ = if getZ vektor1 < getZ vektor2 then getZ vektor1 else getZ vektor2

    in Vector3 { x = minX, y = minY, z = minZ }

magnitude :: Vector3 -> Double
magnitude vektor =
    let kuadratX = getX vektor ** 2.0
        kuadratY = getY vektor ** 2.0
        kuadratZ = getZ vektor ** 2.0
        jumlahKuadratSemua = kuadratX + kuadratY + kuadratZ
        x = sqrt jumlahKuadratSemua
    
    in decimals2 x

normalized :: Vector3 -> Vector3
normalized vektor =
    let
        a = decimals2 (getX vektor / magnitude vektor)
        b = decimals2 (getY vektor / magnitude vektor)
        c = decimals2 (getZ vektor / magnitude vektor)
    
    in Vector3 { x = a, y = b, z = c }

dotProduct :: Vector3 -> Vector3 -> Double
dotProduct vektor1 vektor2 =
    let a = getX vektor1 * getX vektor2
        b = getY vektor1 * getY vektor2
        c = getZ vektor1 * getZ vektor2 

    in decimals2 (a + b + c)

crossProduct :: Vector3 -> Vector3 -> Vector3
crossProduct v w =
    let a = decimals2 ((getY v * getZ w) - (getZ v * getY w))
        b = decimals2 ((getZ v * getX w) - (getX v * getZ w))
        c = decimals2 ((getX v * getY w) - (getY v * getX w))
    in
        Vector3 { x = a, y = b, z = c }

angleRadian :: Vector3 -> Vector3 -> Double
angleRadian v w =
    let a = dotProduct v w
        b = magnitude v * magnitude w
        c = decimals2 (a / b)
    in 
        decimals2 (acos c)

angleDegree :: Vector3 -> Vector3 -> Double
angleDegree v w = decimals1 ((angleRadian v w) * (180.0 / pi))


distance :: Vector3 -> Vector3 -> Double
distance v w =
    let a = (getX w - getX v) ** 2.0
        b = (getY w - getY v) ** 2.0
        c = (getZ w - getZ v) ** 2.0
        d = decimals2 (a + b + c)
    in 
        decimals2 (sqrt d)

scale :: Vector3 -> Double -> Vector3
scale vektor t =
    let xkaliT = decimals2 (getX vektor * t)
        ykaliT = decimals2 (getY vektor * t)
        zkaliT = decimals2 (getZ vektor * t)
    
    in 
        Vector3 { x = xkaliT, y = ykaliT, z = zkaliT }

addVector :: Vector3 -> Vector3 -> Vector3
addVector vektor1 vektor2 = Vector3 (getX vektor1 + getX vektor2) (getY vektor1 + getY vektor2) (getZ vektor1 + getZ vektor2)

subVector :: Vector3 -> Vector3 -> Vector3
subVector vektor1 vektor2 = Vector3 (getX vektor1 - getX vektor2) (getY vektor1 - getY vektor2) (getZ vektor1 - getZ vektor2)

mulVector :: Vector3 -> Vector3 -> Vector3
mulVector vektor1 vektor2 = Vector3 (getX vektor1 * getX vektor2) (getY vektor1 * getY vektor2) (getZ vektor1 * getZ vektor2)

divVector :: Vector3 -> Vector3 -> Vector3
divVector vektor1 vektor2 = 
    let a = decimals1 (getX vektor1 / getX vektor2)
        b = decimals1 (getY vektor1 / getY vektor2)
        c = decimals1 (getZ vektor1 / getZ vektor2)
    in
        Vector3 { x = a, y = b, z = c }

reflect :: Vector3 -> Vector3 -> Vector3
reflect v w =
    let a = 2.0 * dotProduct v w
        b = scale w a
    in 
        subVector v b

learp :: Vector3 -> Vector3 -> Double -> Vector3
learp v w t =
    let a = subVector w v 
        b = scale a t
    in 
        addVector v b




decimals2 :: Double -> Double
decimals2 x = fromIntegral (round (x * 100)) / 100.0

decimals1 :: Double -> Double
decimals1 x = fromIntegral (round (x * 10)) / 10.0



main :: IO ()
main = do
    vx <- readLn :: IO Double
    vy <- readLn :: IO Double
    vz <- readLn :: IO Double
    wx <- readLn :: IO Double
    wy <- readLn :: IO Double
    wz <- readLn :: IO Double
    t <- readLn :: IO Double

   
    let v = makeVector3 vx vy vz
        w = makeVector3 wx wy wz

    putStrLn $ "v = " ++ show v
    putStrLn $ "w = " ++ show w
    putStrLn $ "t = " ++ show t

    putStrLn $ "isOrigin(v) = " ++ show (isOrigin v)
    putStrLn $ "isOrigin(w) = " ++ show (isOrigin w)

    putStrLn $ "isRight(v) = " ++ show (isRight v)
    putStrLn $ "isRight(w) = " ++ show (isRight w)

    putStrLn $ "isUp(v) = " ++ show (isUp v)
    putStrLn $ "isUp(w) = " ++ show (isUp w)

    putStrLn $ "isForward(v) = " ++ show (isForward v)
    putStrLn $ "isForward(w) = " ++ show (isForward w)

    putStrLn $ "isOne(v) = " ++ show (isOne v)
    putStrLn $ "isOne(w) = " ++ show (isOne w)

    putStrLn $ "isLeft(v) = " ++ show (isLeft v)
    putStrLn $ "isLeft(w) = " ++ show (isLeft w)

    putStrLn $ "isDown(v) = " ++ show (isDown v)
    putStrLn $ "isDown(w) = " ++ show (isDown w)

    putStrLn $ "isBack(v) = " ++ show (isBack v)
    putStrLn $ "isBack(w) = " ++ show (isBack w)

    putStrLn $ "isEquals(v, w) = " ++ show (isEquals v w)
    putStrLn $ "isNotEquals(v, w) = " ++ show (isNotEquals v w)

    putStrLn $ "vectorMax(v, w) = " ++ show (vectorMax v w)
    putStrLn $ "vectorMin(v, w) = " ++ show (vectorMin v w)

    putStrLn $ "magnitude(v) = " ++ show (magnitude v)
    putStrLn $ "magnitude(w) = " ++ show (magnitude w)

    putStrLn $ "normalized(v) = " ++ show (normalized v)
    putStrLn $ "normalized(w) = " ++ show (normalized w)

    putStrLn $ "dotProduct(v, w) = " ++ show (dotProduct v w)
    putStrLn $ "crossProduct(v, w) = " ++ show (crossProduct v w)

    putStrLn $ "angle(v, w) [radian] = " ++ show (angleRadian v w)
    putStrLn $ "angle(v, w) [degree] = " ++ show (angleDegree v w)

    putStrLn $ "distance(v, w) = " ++ show (distance v w)
    putStrLn $ "scale(v, t) = " ++ show (scale v t)
    putStrLn $ "addVector(v, w) = " ++ show (addVector v w)
    putStrLn $ "subVector(v, w) = " ++ show (subVector v w)
    putStrLn $ "mulVector(v, w) = " ++ show (mulVector v w)
    putStrLn $ "divVector(v, w) = " ++ show (divVector v w)
    putStrLn $ "reflect(v, w) = " ++ show (reflect v w)
    putStrLn $ "lerp(v, w, t) = " ++ show (learp v w t)
