module Web.View.PlayResults.New where
import Web.View.Prelude

data NewView = NewView { playResult :: PlayResult }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New PlayResult</h1>
        {renderForm playResult}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "PlayResults" PlayResultsAction
                , breadcrumbText "New PlayResult"
                ]

renderForm :: PlayResult -> Html
renderForm playResult = formFor playResult [hsx|
    {(textField #consent)}
    {(textField #playData)}
    {(textField #playerName)}
    {(textField #appName)}
    {submitButton}

|]