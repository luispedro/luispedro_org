module SiteMarkdown exposing (MarkdownFile, mdFiles, mdToHtml, mdToInlineHtml)

import Markdown
import Markdown.Inline
import Markdown.Block
import Html
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


replaceBaseUrl body =
    body
        |> String.replace "{{ site.baseurl }}" ""
        |> String.replace "{{site.baseurl}}" ""

mdToHtml body = Html.div [] (Markdown.toHtml Nothing (replaceBaseUrl body))

mdToInlineHtml body =
    let
        inlines = case Markdown.Block.parse Nothing (replaceBaseUrl body) of
                        [Markdown.Block.Paragraph text pinlines]
                            -> pinlines
                        other -> [Markdown.Inline.Text ("COULD NOT PARSE AS INLINE MARKDOWN : `" ++ body ++ "`")]
    in Html.span [] (List.map Markdown.Inline.toHtml inlines)

