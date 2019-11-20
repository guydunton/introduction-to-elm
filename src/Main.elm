module Main exposing (main)

import Browser
import Html exposing (Html, button, div, img, p, text)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)
import Http
import Json.Decode exposing (Decoder, at, string)


type alias Model =
    { count : Int
    , gifUrl : Maybe String
    }


type Msg
    = GoUp
    | GoDown
    | GotGif (Result Http.Error String)


init : () -> ( Model, Cmd Msg )
init _ =
    ( { count = 0
      , gifUrl = Nothing
      }
    , Http.get
        { url = "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=cat"
        , expect = Http.expectJson GotGif gifDecoder
        }
    )


gifDecoder : Decoder String
gifDecoder =
    at [ "data", "image_url" ] string


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick GoUp ] [ text "+" ]
        , p [] [ text (String.fromInt model.count) ]
        , button [ onClick GoDown ] [ text "-" ]
        , displayGif model.gifUrl
        ]


displayGif : Maybe String -> Html Msg
displayGif maybeUrl =
    case maybeUrl of
        Just url ->
            p [] [ img [ src url ] [] ]

        Nothing ->
            p [] [ text "Image not loaded" ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GoUp ->
            ( { model | count = model.count + 1 }, Cmd.none )

        GoDown ->
            ( { model | count = model.count - 1 }, Cmd.none )

        GotGif result ->
            case result of
                Ok url ->
                    ( { model | gifUrl = Just url }, Cmd.none )

                _ ->
                    ( model, Cmd.none )


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
