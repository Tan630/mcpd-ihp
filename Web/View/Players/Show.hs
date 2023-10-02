module Web.View.Players.Show where
import Web.View.Prelude

data ShowView = ShowView { player :: Player }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show Player</h1>
        <p>{player}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Players" PlayersAction
                            , breadcrumbText "Show Player"
                            ]