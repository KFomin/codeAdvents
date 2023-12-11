module Main exposing (..)

import Browser exposing (Document)
import FirstAdventPuzzle
import Html exposing (Html, text)
import SecondAdventPuzzle
import ThirdAdventPuzzle



-- MAIN


main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { firstAdventPart1 : Int
    , firstAdventPart2 : Int
    , secondAdventPart1 : Int
    , secondAdventPart2 : Int
    , thirdAdventPart1 : Int
    }


type alias Flags =
    {}


init : Flags -> ( Model, Cmd Msg )
init _ =
    let
        _ =
            Debug.log "checkLog" ThirdAdventPuzzle.solvePart1
    in
    ( { firstAdventPart1 = 0
      , firstAdventPart2 = 0
      , secondAdventPart1 = 0
      , secondAdventPart2 = 0
      , thirdAdventPart1 = 0
      }
    , Cmd.batch
        [ FirstAdventPuzzle.solvePart1 FirstPuzzleSolved
        , FirstAdventPuzzle.solvePart2 FirstPuzzlePart2Solved
        , SecondAdventPuzzle.solvePart1 SecondAdventPuzzleSolved
        , SecondAdventPuzzle.solvePart2 SecondAdventPuzzlePart2Solved
        , ThirdAdventPuzzle.solvePart1 ThirdAdventPuzzleSolved
        ]
    )



-- UPDATE


type Msg
    = FirstPuzzleSolved Int
    | FirstPuzzlePart2Solved Int
    | SecondAdventPuzzleSolved Int
    | SecondAdventPuzzlePart2Solved Int
    | ThirdAdventPuzzleSolved Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FirstPuzzleSolved code ->
            ( { model | firstAdventPart1 = code }
            , Cmd.none
            )

        FirstPuzzlePart2Solved code ->
            ( { model | firstAdventPart2 = code }
            , Cmd.none
            )

        SecondAdventPuzzleSolved result ->
            ( { model | secondAdventPart1 = result }
            , Cmd.none
            )

        SecondAdventPuzzlePart2Solved result ->
            ( { model | secondAdventPart2 = result }
            , Cmd.none
            )

        ThirdAdventPuzzleSolved result ->
            ( { model | thirdAdventPart1 = result }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.batch []



-- VIEW


view : Model -> Document Msg
view model =
    { title = "Advent solutions"
    , body =
        [ Html.ul []
            [ Html.li []
                [ Html.p []
                    [ text "First advent part1: "
                    , text (String.fromInt model.firstAdventPart1)
                    ]
                ]
            , Html.li []
                [ Html.p []
                    [ text "First advent part2: "
                    , text (String.fromInt model.firstAdventPart2)
                    ]
                ]
            , Html.li []
                [ Html.p []
                    [ text "Second advent part1: "
                    , text (String.fromInt model.secondAdventPart1)
                    ]
                ]
            , Html.li []
                [ Html.p []
                    [ text "Second advent part2: "
                    , text (String.fromInt model.secondAdventPart2)
                    ]
                ]
            , Html.li []
                [ Html.p []
                    [ text "Third advent part1: "
                    , text (String.fromInt model.thirdAdventPart1)
                    ]
                ]
            ]
        ]
    }
