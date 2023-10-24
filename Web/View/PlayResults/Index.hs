module Web.View.PlayResults.Index where
import Web.View.Prelude

data IndexView = IndexView { playResults :: [PlayResult]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewPlayResultAction} class="btn btn-primary ms-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>PlayResult</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach playResults renderPlayResult}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "PlayResults" PlayResultsAction
                ]

renderPlayResult :: PlayResult -> Html
renderPlayResult playResult = [hsx|
    <tr>
        <td>{playResult}</td>
        <td><a href={ShowPlayResultAction playResult.id}>Show</a></td>
        <td><a href={EditPlayResultAction playResult.id} class="text-muted">Edit</a></td>
        <td><a href={DeletePlayResultAction playResult.id} class="js-delete text-muted">Delete</a></td>
    </tr>
|]