module SiteMarkdown exposing (MarkdownFile, mdFiles, mdToHtml, mdToInlineHtml)

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

