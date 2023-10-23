module Web.View.Apps.Index where
import Web.View.Prelude

data IndexView = IndexView { apps :: [App]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewAppAction} class="btn btn-primary ms-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>App</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach apps renderApp}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Apps" AppsAction
                ]

renderApp :: App -> Html
renderApp app = [hsx|
    <tr>
        <td>{app}</td>
        <td><a href={ShowAppAction app.id}>Show</a></td>
        <td><a href={EditAppAction app.id} class="text-muted">Edit</a></td>
        <td><a href={DeleteAppAction app.id} class="js-delete text-muted">Delete</a></td>
    </tr>
|]