module Update exposing (..)

import Model exposing (Model)
import Msg exposing (Msg(NoOp, UpdateParamA, UpdateParamB))


update : Msg -> Model -> Model
update msg model =
    let
        origFunc =
            model.func
    in
    case msg of
        NoOp ->
            model

        UpdateParamA newA ->
            { model | func = { origFunc | a = newA } }

        UpdateParamB newB ->
            { model | func = { origFunc | b = newB } }
