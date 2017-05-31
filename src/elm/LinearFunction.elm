module LinearFunction exposing (..)


type alias LinearFunction =
    { a : Float
    , b : Float
    }


applyTo : LinearFunction -> Float -> Float
applyTo f x =
    f.a * x + f.b
