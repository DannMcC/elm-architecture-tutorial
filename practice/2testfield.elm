import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
    Html.beginnerProgram { model = model, view = view, update = update }

{- MODEL
since we are making a text field that will flip inout, we will use a simple record that holds a String
-}
type alias Model =
    { content : String
    }

model : Model
model =
    {content = ""}

{-UPDATE
The the user inputs text throgh the UI it will update, so we have the Msg change the string
-}

type Msg
    = Change String

update: Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }

{-VIEW
-}
view: Model -> Html Msg
view model =
    div []
    [ input [ placeholder "text to reverse", onInput Change] []
    , div [] [text (String.reverse model.content)]
    ]
