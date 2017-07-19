import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
    Html.beginnerProgram { model = model , view = view , update = update }

{-- MODEL
Here we make a new type that we can use in the app it is an alias for the Int type.
--}
type alias Model = Int

model : Model
model =
        0


{--UPDATE
Here we define the messages that will be received from the UI in VIEW
--}

type Msg = Increment | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

--VIEW

view : Model -> Html Msg
view model =
    div[]
        [ button [ onClick Decrement] [ text "-"]
        , div [] [ text (toString model) ]
        , button [ onClick Increment] [ text "+"]
        ]
