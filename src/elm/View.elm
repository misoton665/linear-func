module View exposing (..)

import Graph exposing (graphSvg)
import Html exposing (Html, button, div, h1, img, input, p, span, text)
import Html.Attributes exposing (class, src, style, type_, value)
import Html.Events exposing (onClick, onInput)
import Model exposing (Model)
import Msg exposing (Msg(NoOp, UpdateParamA, UpdateParamB, UpdateParamC))
import QuadFunc exposing (QuadFunc, paramA, paramB, paramC, topOfGraph)


view : Model -> Html Msg
view model =
    div [ style styles.top ]
        [ textView model
        , visualView model
        ]


textView : Model -> Html Msg
textView model =
    let
        paramText getParam =
            toString << getParam <| model.quadFunc

        updateParamMsg default msg txt =
            Result.withDefault NoOp <| Result.map msg <| String.toFloat txt

        updateParamA =
            updateParamMsg (paramA model.quadFunc) UpdateParamA

        updateParamB =
            updateParamMsg (paramB model.quadFunc) UpdateParamB

        updateParamC =
            updateParamMsg (paramC model.quadFunc) UpdateParamC
    in
    div [ style styles.editingView ]
        [ h1 [] [ text "FORMULA" ]
        , div [ style styles.editor ]
            [ text "y = "
            , input [ value <| paramText paramA, type_ "number", onInput updateParamA ] []
            , text "x^2 + "
            , input [ value <| paramText paramB, type_ "number", onInput updateParamB ] []
            , text "x + "
            , input [ value <| paramText paramC, type_ "number", onInput updateParamC ] []
            ]
        ]


visualView : Model -> Html Msg
visualView model =
    let
        top =
            topOfGraph model.quadFunc
    in
    div [ style styles.showingView ]
        [ h1 [] [ text "GRAPH" ]
        , div [ style styles.viewer ]
            [ graphSvg -200 -200 200 200 model
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
