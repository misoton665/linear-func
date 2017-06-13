module Msg exposing (..)

import Keyboard exposing (KeyCode)


-- UPDATE


type Msg
    = NoOp
    | KeyDown KeyCode
    | UpdateParamA Float
    | UpdateParamB Float
