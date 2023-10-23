module Web.View.Apps.Edit where
import Web.View.Prelude

data EditView = EditView { app :: App }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit App</h1>
        {renderForm app}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Apps" AppsAction
                , breadcrumbText "Edit App"
                ]

renderForm :: App -> Html
renderForm app = formFor app [hsx|
    {(textField #name)}
    {submitButton}

|]