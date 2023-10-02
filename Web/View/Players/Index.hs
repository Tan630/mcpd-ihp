module Web.View.Players.Index where
import Web.View.Prelude

data IndexView = IndexView { players :: [Player]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewPlayerAction} class="btn btn-primary ms-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Player</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach players renderPlayer}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Players" PlayersAction
                ]

renderPlayer :: Player -> Html
renderPlayer player = [hsx|
    <tr>
        <td>{player}</td>
        <td><a href={ShowPlayerAction player.id}>Show</a></td>
        <td><a href={EditPlayerAction player.id} class="text-muted">Edit</a></td>
        <td><a href={DeletePlayerAction player.id} class="js-delete text-muted">Delete</a></td>
    </tr>
|]