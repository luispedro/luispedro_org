module NotFound exposing (document)

{-| The site's not-found page, generated as a plain `404.html` by `Api.routes`.

Netlify serves `404.html` for any URL that does not match a file in the deploy,
so this page is displayed under whatever address the visitor typed. That rules
out writing it as a normal elm-pages route: every prerendered page boots the Elm
app against `window.location`, and for an unknown path the router finds no page
data and replaces the page with the elm-pages error screen. Hence a static file
with no elm-pages runtime.

It is generated rather than hand-written so that the top bar, the sidebar and
the footer come from `Shared` and cannot drift from the rest of the site.

-}

import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Html exposing (Html)
import Html.Attributes as HtmlAttr

import Shared


{-| The complete file. `htmlToString` is the renderer elm-pages hands to
`Api.routes`.
-}
document : (Html Never -> String) -> String
document htmlToString =
    header ++ htmlToString page ++ footer


header : String
header =
    """<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="robots" content="noindex">
<title>Page not found &mdash; Luis Pedro Coelho</title>
<link rel="stylesheet" href="/style.css">
</head>
<body>
"""


footer : String
footer =
    """
<script>
// The page is served under the address the visitor asked for, so we can tell
// them which one that was.
document.getElementById('requested-path').textContent = window.location.pathname;
</script>
</body>
</html>
"""


page : Html Never
page =
    -- The same frame as `Shared.view`, which cannot be reused directly: it
    -- returns a `View msg` for the elm-pages runtime.
    Html.div []
        [ CDN.stylesheet
        , CDN.fontAwesome
        , Grid.containerFluid []
            [ Grid.simpleRow
                [ Grid.col []
                    [ Html.div [HtmlAttr.style "padding-top" "1em"] []
                    , Shared.header
                    , Grid.simpleRow
                        [ Grid.col [Col.xs3, Col.attrs [HtmlAttr.id "leftbar"]]
                            [Shared.navigation]
                        , Grid.col [Col.xs9]
                            [body]
                        ]
                    , Html.hr [] []
                    , Shared.footer
                    ]
                ]
            ]
        ]


body : Html Never
body =
    Html.div []
        [ Html.h1 [] [Html.text "Page not found"]
        , Html.p []
            [Html.text "Sorry, there is no page at "
            ,Html.code [HtmlAttr.id "requested-path"] []
            ,Html.text ". It may have been moved or renamed, or the link that brought you here may have a typo in it."
            ]
        , whereToGo
        ]


whereToGo : Html Never
whereToGo =
    -- Written out as Html rather than Markdown: `SiteMarkdown.mdToHtml` is
    -- rendered by the Elm runtime in the browser, so it comes out empty in a
    -- statically generated file. The list repeats part of the sidebar on
    -- purpose: `style.css` hides `#leftbar` on narrow screens.
    Html.div []
        [ Html.h4 [] [Html.text "Where to go from here"]
        , Html.p [] [link "/" "Home page"]
        , Html.p [] [link "/publications" "Publications", Html.text " and my ", link "/resume" "CV"]
        , Html.p [] [link "/talks" "Slides from talks", Html.text " and ", link "/travel" "upcoming travels"]
        , Html.p [] [link "/software/" "Software", Html.text " — mahotas, jug, SemiBin, NGLess, and more"]
        , Html.p [] [link "https://metarabbit.wordpress.com/" "Metarabbit", Html.text ", my blog"]
        , Html.p [] [link "https://big-data-biology.org/" "Big Data Biology Lab", Html.text ", my research group"]
        , Html.p [] [link "/contact" "Contact"]
        , Html.p []
            [Html.text "If you followed a link on this site and ended up here, I would like to fix it: please "
            ,link "https://github.com/luispedro/luispedro_org/issues" "report it as an issue"
            ,Html.text "."
            ]
        ]


link : String -> String -> Html Never
link target name =
    Html.a [HtmlAttr.href target] [Html.text name]
