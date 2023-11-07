module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types
import IHP.LoginSupport.Types

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

data PlayResultsController
    = PlayResultsAction
    | NewPlayResultAction
    | ShowPlayResultAction { playResultId :: !(Id PlayResult) }
    | CreatePlayResultAction
    | EditPlayResultAction { playResultId :: !(Id PlayResult) }
    | UpdatePlayResultAction { playResultId :: !(Id PlayResult) }
    | DeletePlayResultAction { playResultId :: !(Id PlayResult) }
    deriving (Eq, Show, Data)



-- ADD THIS TO THE END OF THE FILE

instance HasNewSessionUrl User where
    newSessionUrl _ = "/NewSession"

type instance CurrentUserRecord = User
data SessionsController
    = NewSessionAction
    | CreateSessionAction
    | DeleteSessionAction
    deriving (Eq, Show, Data)