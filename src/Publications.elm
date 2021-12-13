module Publications exposing (Publication, papersLPC, showAuthors)

import DataSource exposing (DataSource)
import DataSource.File

import Html
import Html.Attributes as HtmlAttr

import Yaml.Decode as Decode

type alias Publication =
    { title : String
    --, slug : String
    --, short_description : String
    --, abstract : String
    , journal : String
    --, date : String
    , year : Int
    , doi : String
    , authors : List String
    , isFirstLast : Bool
    }

readPublication =
    Decode.map6 Publication
        (Decode.field "Title" Decode.string)
        (Decode.field "Journal" Decode.string)
        (Decode.field "Year" Decode.int)
        (Decode.field "Doi" Decode.string)
        (Decode.field "Authors" (Decode.list Decode.string))
        (Decode.field "isFirstLast" Decode.bool)

papersLPC : DataSource (List Publication)
papersLPC =
    DataSource.File.rawFile "papers.yaml"
        |> DataSource.andThen (\raw ->
            raw
                |> Decode.fromString (Decode.list readPublication)
                |> Result.mapError (\err -> case err of
                                        Decode.Parsing s -> "Parse error: " ++ s
                                        Decode.Decoding s -> "Decode error: " ++ s)
                |> DataSource.fromResult)
        |> DataSource.map List.reverse


isLPC : String -> Bool
isLPC a = String.contains "Coelho" a && String.startsWith "L" a

removeExtraAuthors ax =
    let
        initial = List.take 3 ax
        end = List.drop (List.length ax - 3) ax
        middle = if List.any isLPC (initial ++ end)
                    then ["..."]
                    else ["...", "Luis Pedro Coelho", "..."]
    in
        initial ++ middle ++ end


showAuthors useFull ax =
    let
        shorterAuthors = if useFull || List.length ax <= 7
                            then ax
                            else removeExtraAuthors ax
        showAuthor a =
            if isLPC a
                then Html.b [] [Html.text a]
                else Html.text a
    in List.intersperse (Html.text ", ") (List.map showAuthor shorterAuthors)

