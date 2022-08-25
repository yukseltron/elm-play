module Main exposing (..)
import Browser
import Html exposing (Html, Attribute, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Html.Events exposing (onInput)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    {
      content : String,
      data: Int
    }

init : Model
init =
    { content = "", data = 0 }



-- UPDATE


type Msg
  = Increment
  | Decrement
  | Reset
  | IncrementTen
  | Change String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      { model | data = model.data + 1 }

    Decrement ->
      { model | data = model.data - 1 }

    Reset ->
      { model | data = 0 }

    IncrementTen ->
      { model | data = model.data + 10 }

    Change newContent ->
      { model | content = newContent }



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model.data) ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick IncrementTen ] [ text "+10" ]
    , button [ onClick Reset ] [ text "Reset" ]
    , input [ placeholder "Text to reverse", value model.content, onInput Change ] []
    , div [] [ text (String.reverse model.content) ]
    ]
