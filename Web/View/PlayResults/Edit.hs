module Web.View.PlayResults.Edit where
import Web.View.Prelude

data EditView = EditView { playResult :: PlayResult }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit PlayResult</h1>
        {renderForm playResult}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "PlayResults" PlayResultsAction
                , breadcrumbText "Edit PlayResult"
                ]

renderForm :: PlayResult -> Html
renderForm playResult = formFor playResult [hsx|
    {(textField #consent)}
    {(textField #playData)}
    {(textField #playerName)}
    {(textField #appName)}
    {submitButton}

|]