module Update exposing (..)

import Keyboard exposing (KeyCode)
import Model exposing (Model)
import Msg exposing (Msg(KeyDown, NoOp, UpdateParamA, UpdateParamB))


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    let
        origFunc =
            model.func
    in
    (case msg of
        NoOp ->
            model

        UpdateParamA newA ->
            { model | func = { origFunc | a = newA } }

        UpdateParamB newB ->
            { model | func = { origFunc | b = newB } }

        KeyDown keycode ->
            if keycode == keyCodes.up then
                { model | func = {origFunc | b = origFunc.b + 0.20}}

            else if keycode == keyCodes.down then
                { model | func = {origFunc | b = origFunc.b - 0.20}}

            else if keycode == keyCodes.left then
                { model | func = {origFunc | a = origFunc.a + 0.20}}

            else if keycode == keyCodes.right then
                { model | func = {origFunc | a = origFunc.a - 0.20}}

            else
                model

                , Cmd.none)


keyCodes : {up: KeyCode, down: KeyCode, left: KeyCode, right: KeyCode}
keyCodes =
    {
        up = 38,
        down = 40,
        left = 37,
        right = 39
    }
