module QuadFunc exposing (..)


type QuadFunc
    = QuadFunc Float Float Float


type alias Point =
    { x : Float
    , y : Float
    }


applyTo : QuadFunc -> Float -> Float
applyTo (QuadFunc a b c) x =
    a * x * x + b * x + c


topOfGraph : QuadFunc -> Point
topOfGraph (QuadFunc a b c) =
    let
        p =
            -1 * (b / (2 * a))

        q =
            c - ((b * b) / (4 * a))
    in
    { x = p, y = q }


paramA : QuadFunc -> Float
paramA (QuadFunc a _ _) =
    a


paramB : QuadFunc -> Float
paramB (QuadFunc _ b _) =
    b


paramC : QuadFunc -> Float
paramC (QuadFunc _ _ c) =
    c
