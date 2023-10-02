module Web.View.Players.Edit where
import Web.View.Prelude

data EditView = EditView { player :: Player }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit Player</h1>
        {renderForm player}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Players" PlayersAction
                , breadcrumbText "Edit Player"
                ]

renderForm :: Player -> Html
renderForm player = formFor player [hsx|
    {(textField #name)}
    {submitButton}

|]