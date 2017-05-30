module Update exposing (..)

import Model exposing (Model)
import Msg exposing (Msg(NoOp, UpdateParamA, UpdateParamB, UpdateParamC))
import QuadFunc exposing (QuadFunc(QuadFunc), paramA, paramB, paramC)


update : Msg -> Model -> Model
update msg model =
    let
        a =
            paramA model.quadFunc

        b =
            paramB model.quadFunc

        c =
            paramC model.quadFunc
    in
    case msg of
        NoOp ->
            model

        UpdateParamA newA ->
            { model | quadFunc = QuadFunc newA b c }

        UpdateParamB newB ->
            { model | quadFunc = QuadFunc a newB c }

        UpdateParamC newC ->
            { model | quadFunc = QuadFunc a b newC }
