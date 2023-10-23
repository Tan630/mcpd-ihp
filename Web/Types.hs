module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data PlayersController
    = PlayersAction
    | NewPlayerAction
    | ShowPlayerAction { playerId :: !(Id Player) }
    | CreatePlayerAction
    | EditPlayerAction { playerId :: !(Id Player) }
    | UpdatePlayerAction { playerId :: !(Id Player) }
    | DeletePlayerAction { playerId :: !(Id Player) }
    deriving (Eq, Show, Data)

data AppsController
    = AppsAction
    | NewAppAction
    | ShowAppAction { appId :: !(Id App) }
    | CreateAppAction
    | EditAppAction { appId :: !(Id App) }
    | UpdateAppAction { appId :: !(Id App) }
    | DeleteAppAction { appId :: !(Id App) }
    deriving (Eq, Show, Data)
