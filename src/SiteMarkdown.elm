module SiteMarkdown exposing (MarkdownFile, mdFiles, mdToHtml)

import Markdown
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


markdownOptions : Markdown.Options
markdownOptions =
    { githubFlavored = Just { tables = True, breaks = False }
    , defaultHighlighting = Nothing
    , sanitize = False
    , smartypants = False
    }

replaceBaseUrl body =
    body
        |> String.replace "{{ site.baseurl }}" ""
        |> String.replace "{{site.baseurl}}" ""
mdToHtml body = Markdown.toHtmlWith markdownOptions [] (replaceBaseUrl body)
