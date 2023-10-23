module Web.View.Apps.Show where
import Web.View.Prelude

data ShowView = ShowView { app :: App }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show App</h1>
        <p>{app}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Apps" AppsAction
                            , breadcrumbText "Show App"
                            ]