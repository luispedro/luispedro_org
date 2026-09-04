module SiteMarkdown exposing (MarkdownFile, firstParagraph, mdFiles, mdToHtml, mdToInlineHtml)

import Markdown
import Markdown.Inline
import Markdown.Config as Markdown
import Markdown.Block
import Html
import Regex exposing (Regex)
import DataSource exposing (DataSource)
import DataSource.Glob as Glob

type MDFiletype =
    BlogPost | RegularPage

type alias MarkdownFile =
    { path : String
    , spath : List String
    , slug : String
    }

mdFiles :
    String ->
    DataSource
        (List MarkdownFile)
mdFiles root =
    Glob.succeed MarkdownFile
        |> Glob.captureFilePath
        |> Glob.match (Glob.literal root)
        |> Glob.capture Glob.recursiveWildcard
        |> Glob.match (Glob.literal "/")
        |> Glob.capture Glob.wildcard
        |> Glob.match (Glob.literal ".md")
        |> Glob.toDataSource
        |> DataSource.map (List.filter (\f -> f.slug /= "README"))


{-| HTML comments are not understood by the markdown parser: with
`Markdown.Sanitize`, a `<!-- ... -->` block is escaped and printed as visible
text. Strip comments out before parsing so that they behave as comments.

Following CommonMark, an unterminated `<!--` comments out the rest of the
document.
-}
commentRegex : Regex
commentRegex =
    Regex.fromString "<!--(?:[\\s\\S]*?-->|[\\s\\S]*$)"
        |> Maybe.withDefault Regex.never


stripComments : String -> String
stripComments = Regex.replace commentRegex (always "")


{-| The text of the first paragraph of a document, for use as a meta
description when the front matter does not set one. Leading headings (which
most pages open with) are skipped, as are paragraphs of raw HTML, whitespace is
collapsed and the result is truncated on a word boundary.
-}
firstParagraph : String -> Maybe String
firstParagraph body =
    Markdown.Block.parse Nothing (stripComments body)
        |> List.filterMap
            (\block ->
                case block of
                    Markdown.Block.Paragraph _ inlines ->
                        Just (Markdown.Inline.extractText inlines)

                    _ ->
                        Nothing
            )
        |> List.filter (\text -> not (String.startsWith "<" (String.trimLeft text)))
        |> List.head
        |> Maybe.map (String.words >> truncateWords 155 [] 0)


truncateWords : Int -> List String -> Int -> List String -> String
truncateWords budget acc len words =
    case words of
        [] ->
            String.join " " (List.reverse acc)

        w :: rest ->
            if len + String.length w > budget then
                String.join " " (List.reverse acc) ++ "\u{2026}"

            else
                truncateWords budget (w :: acc) (len + String.length w + 1) rest


mdToHtml body_ =
    let
        body = stripComments body_
        defaultSanitizeOptions = Markdown.defaultSanitizeOptions
        sanitizeOptions =
            { allowedHtmlAttributes =
                [ "alt", "src", "style"
                , "width", "height"
                , "controls", "poster", "preload", "loop", "muted", "playsinline"
                , "type"
                ] ++ defaultSanitizeOptions.allowedHtmlAttributes
            , allowedHtmlElements =
                [ "a", "img"
                , "video", "audio", "source"
                ] ++ defaultSanitizeOptions.allowedHtmlElements
            }
        options = Just {
            softAsHardLineBreak = False
            , rawHtml = Markdown.Sanitize sanitizeOptions
            }
    in Html.div [] (Markdown.toHtml options body)

mdToInlineHtml body =
    let
        inlines = case Markdown.Block.parse Nothing body of
                        [Markdown.Block.Paragraph text pinlines]
                            -> pinlines
                        other -> [Markdown.Inline.Text ("COULD NOT PARSE AS INLINE MARKDOWN : `" ++ body ++ "`")]
    in Html.span [] (List.map Markdown.Inline.toHtml inlines)

