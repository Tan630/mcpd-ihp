module Web.View.Players.New where
import Web.View.Prelude

data NewView = NewView { player :: Player }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Player</h1>
        {renderForm player}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Players" PlayersAction
                , breadcrumbText "New Player"
                ]

renderForm :: Player -> Html
renderForm player = formFor player [hsx|
    {(textField #name)}
    {submitButton}

|]