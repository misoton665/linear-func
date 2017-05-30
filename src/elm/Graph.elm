module Graph exposing (..)

import Html exposing (Html)
import Model exposing (Model)
import Msg exposing (Msg)
import QuadFunc exposing (applyTo, paramA, paramB, topOfGraph)
import Svg exposing (circle, line, path, svg)
import Svg.Attributes exposing (cx, cy, d, fill, id, r, stroke, strokeWidth, viewBox, x1, x2, y1, y2)


graphSvg : Float -> Float -> Float -> Float -> Model -> Html Msg
graphSvg xtop ytop xbtm ybtm model =
    let
        top =
            topOfGraph model.quadFunc

        yy1 = (applyTo model.quadFunc (xtop / 100)) * 100

        yy2 = (applyTo model.quadFunc (xbtm / 100)) * 100

        po =
            Debug.log "hog" <| "M " ++ toString xtop ++ " " ++ (toString <| -1 * yy1) ++ " Q " ++ (toString <| -1 * top.x) ++ " " ++ (toString <| -1 * (top.y - yy1)) ++ " " ++ toString xbtm ++ " " ++ (toString <| -1 * yy2)
    in
    svg
        [ id "mpath"
        , viewBox <| List.foldl (\x acc -> x ++ " " ++ acc) "" <| List.reverse <| List.map toString [ xtop, ytop, xbtm - xtop, ybtm - ytop ]
        ]
        [ circle [ cx "0", cy "0" , r "2", fill "#2a2a2a" ] []
        , circle [ cx <| toString <| -1 * top.x, cy <| toString <| -1 * (top.y - yy1) , r "2", fill "#2a2a2a" ] []
            , xAxisSvg ytop ybtm
        , yAxisSvg xtop
            ybtm
        ,   path
            [ d <| "M " ++ toString xtop ++ " " ++ (toString <| -1 * yy1) ++ " Q " ++ (toString <| -1 * top.x) ++ " " ++ (toString <| -1 * (top.y - yy1)) ++ " " ++ toString xbtm ++ " " ++ (toString <| -1 * yy2)
            , fill "none"
            , stroke "blue"
            , strokeWidth "1"
            ]
            []
        ]


xAxisSvg : Float -> Float -> Html msg
xAxisSvg ytop ybtm =
    line
        [ x1 "0"
        , y1 <| toString ytop
        , x2 "0"
        , y2 <| toString ybtm
        , stroke "gray"
        , strokeWidth "1"
        ]
        []


yAxisSvg : Float -> Float -> Html msg
yAxisSvg xtop xbtm =
    line
        [ x1 <| toString xtop
        , y1 "0"
        , x2 <| toString xbtm
        , y2 "0"
        , stroke "gray"
        , strokeWidth "1"
        ]
        []
