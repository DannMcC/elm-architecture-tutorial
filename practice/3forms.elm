import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
  Html.beginnerProgram { model = model, view = view, update = update }


{-Model
The model for this project is a record that holds three strings, name, password, confirm passowrd
-}

type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    }


model : Model
model =
    Model "" "" ""

{-Update
When text is entered, a msg is sent that updates the model with the three fields-}

type Msg
    = Name String
    | Password String
    | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        PasswordAgain password ->
            { model | passwordAgain = password }

{-View
The View displays three fields for the users name, and 2 pws to be entered
additionally, it also contains the logic that will compare the two passwords and populate a message that notifies the
user if they are the two pws match
-}
view : Model -> Html Msg
view model =
    div []
    [ input [ type_ "text", placeholder "Name", onInput Name ] []
    , input [ type_ "password", placeholder "Password", onInput Password ] []
    , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
    , viewValidation model
    ]

viewValidation : Model -> Html msg
viewValidation model =
    let
        (color, message) =
            if model.password == model.passwordAgain then
                ("green", "Ok")
            else
                ("red", "Your Passwords do not Match!")
    in
        div [ style [("color", color)] ] [text message]
