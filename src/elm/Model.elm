module Model exposing (..)

import LinearFunction exposing (LinearFunction)


-- MODEL


type alias Model =
    { func : LinearFunction }


initialModel : Model
initialModel =
    { func = { a = 1.5, b = 3 }
    }
