module Web.View.PlayResults.Show where
import Web.View.Prelude

data ShowView = ShowView { playResult :: PlayResult }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show PlayResult</h1>
        <p>{playResult}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "PlayResults" PlayResultsAction
                            , breadcrumbText "Show PlayResult"
                            ]