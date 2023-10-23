module Web.View.Apps.New where
import Web.View.Prelude

data NewView = NewView { app :: App }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New App</h1>
        {renderForm app}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Apps" AppsAction
                , breadcrumbText "New App"
                ]

renderForm :: App -> Html
renderForm app = formFor app [hsx|
    {(textField #name)}
    {submitButton}

|]