module Main exposing (..)

-- component import example

import Html
import Model exposing (Model, initialModel)
import Msg exposing (Msg)
import Update exposing (update)
import View exposing (view)


-- APP


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = initialModel, view = view, update = update }
