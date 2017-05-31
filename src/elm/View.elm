module View exposing (..)

import Graph exposing (graphSvg)
import Html exposing (Html, button, div, h1, img, input, p, span, text)
import Html.Attributes exposing (class, src, style, type_, value)
import Html.Events exposing (onClick, onInput)
import Model exposing (Model)
import Msg exposing (Msg(NoOp, UpdateParamA, UpdateParamB))


view : Model -> Html Msg
view model =
    div [ style styles.top ]
        [ textView model
        , visualView model
        ]


textView : Model -> Html Msg
textView model =
    let
        paramText param =
            toString << param <| model.func

        updateParamMsg msg txt =
            Result.withDefault NoOp <| Result.map msg <| String.toFloat txt

        updateParamA =
            updateParamMsg UpdateParamA

        updateParamB =
            updateParamMsg UpdateParamB
    in
    div [ style styles.editingView ]
        [ h1 [] [ text "FORMULA" ]
        , div [ style styles.editor ]
            [ text "y = "
            , input [ value <| paramText .a, type_ "number", onInput updateParamA ] []
            , text "x + "
            , input [ value <| paramText .b, type_ "number", onInput updateParamB ] []
            ]
        ]


visualView : Model -> Html Msg
visualView model =
    div [ style styles.showingView ]
        [ h1 [] [ text "GRAPH" ]
        , div [ style styles.viewer ]
            [ graphSvg -400 -400 400 400 100 model
            ]
        ]


type alias Style =
    List ( String, String )


(=>) : a -> b -> ( a, b )
(=>) =
    (,)


styles :
    { top : Style
    , editingView : Style
    , editor : Style
    , showingView : Style
    , viewer : Style
    }
styles =
    { top = [ "display" => "flex", "height" => "100%" ]
    , editingView = [ "width" => "50%", "background" => "#eeeeee", "height" => "100%", "padding" => "16px", "display" => "flex", "flex-direction" => "column", "resize" => "none" ]
    , editor = [ "width" => "100%", "resize" => "none", "height" => "80%", "padding" => "4px" ]
    , showingView = [ "flex" => "1", "background" => "#ffffff", "height" => "100%", "padding" => "16px", "width" => "50%" ]
    , viewer = [ "width" => "100%", "overflow" => "scroll", "padding" => "4px", "height" => "80%", "border" => "1px solid #aaa" ]
    }
