module Model exposing (..)

import QuadFunc exposing (QuadFunc(QuadFunc))


-- MODEL


type alias Model =
    { quadFunc : QuadFunc }


initialModel : Model
initialModel =
    { quadFunc = QuadFunc 2 4 3
    }
