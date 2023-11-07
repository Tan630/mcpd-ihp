module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.PlayResults
import Web.Controller.Apps
import Web.Controller.Players
import Web.Controller.Static

import IHP.LoginSupport.Middleware
import Web.Controller.Sessions

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        , parseRoute @SessionsController 
        -- Generator Marker
        , parseRoute @PlayResultsController
        , parseRoute @AppsController
        , parseRoute @PlayersController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
        initAuthentication @User
