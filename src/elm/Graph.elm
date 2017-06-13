module Graph exposing (..)

import Html exposing (Html)
import LinearFunction
import Model exposing (Model)
import Msg exposing (Msg)
import Svg exposing (circle, line, path, svg)
import Svg.Attributes exposing (cx, cy, d, fill, id, r, stroke, strokeWidth, viewBox, x1, x2, y1, y2)
import Json.Decode as Json


graphSvg : Float -> Float -> Float -> Float -> Float -> Model -> Html Msg
graphSvg xtop ytop xbtm ybtm zoom model =
    let
        yy0 =
            LinearFunction.applyTo model.func 0.0 * zoom

        yy1 =
            LinearFunction.applyTo model.func (xtop / zoom) * zoom

        yy2 =
            LinearFunction.applyTo model.func (xbtm / zoom) * zoom

        dSetting =
            "M " ++ toString xtop ++ " " ++ (toString <| -1.0 * yy1) ++ " Q " ++ (toString <| 0.0) ++ " " ++ (toString <| -1.0 * yy0) ++ " " ++ toString xbtm ++ " " ++ (toString <| -1.0 * yy2)

        logDSetting =
            Debug.log "dSetting" dSetting
    in
    svg
        [ id "mpath"
        , viewBox <| List.foldl (\x acc -> x ++ " " ++ acc) "" <| List.reverse <| List.map toString [ xtop, ytop, xbtm - xtop, ybtm - ytop ]
        ]
        [ circle [ cx "0", cy "0", r "2", fill "#2a2a2a" ] []
        , circle [ cx "0", cy <| toString <| -1.0 * yy0, r "2", fill "#2a2a2a" ] []
        , xAxisSvg ytop ybtm
        , yAxisSvg xtop
            ybtm
        , path
            [ d dSetting
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
