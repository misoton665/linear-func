module Main exposing (..)

-- component import example

import Html
import Keyboard
import Model exposing (Model, initialModel)
import Msg exposing (Msg(KeyDown))
import Update exposing (update)
import View exposing (view)


-- APP


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ Keyboard.downs Msg.KeyDown
        ]


main : Program Never Model Msg
main =
    Html.program { init = init, view = view, update = update, subscriptions = subscriptions }
