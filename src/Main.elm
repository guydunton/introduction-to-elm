module Main exposing (main)

import Browser
import Html exposing (Html, button, div, img, p, text)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)


type alias Model =
    Int


type Msg
    = GoUp
    | GoDown


init : Model
init =
    0


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick GoUp ] [ text "+" ]
        , p [] [ text (String.fromInt model) ]
        , button [ onClick GoDown ] [ text "-" ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        GoUp ->
            model + 1

        GoDown ->
            model - 1


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }
