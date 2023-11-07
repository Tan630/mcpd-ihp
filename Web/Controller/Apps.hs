module Web.Controller.Apps where

import Web.Controller.Prelude
import Web.View.Apps.Index
import Web.View.Apps.New
import Web.View.Apps.Edit
import Web.View.Apps.Show

instance Controller AppsController where
    action AppsAction = do
        apps <- query @App |> fetch
        render IndexView { .. }

    action NewAppAction = do
        let app = newRecord
        render NewView { .. }

    action ShowAppAction { appId } = do
        app <- fetch appId
        render ShowView { .. }

    action EditAppAction { appId } = do
        app <- fetch appId
        render EditView { .. }

    action UpdateAppAction { appId } = do
        app <- fetch appId
        app
            |> buildApp
            |> ifValid \case
                Left app -> render EditView { .. }
                Right app -> do
                    app <- app |> updateRecord
                    setSuccessMessage "App updated"
                    redirectTo EditAppAction { .. }

    action CreateAppAction = do
        ensureIsUser
        let app = newRecord @App
        app
            |> buildApp
            |> ifValid \case
                Left app -> render NewView { .. } 
                Right app -> do
                    app <- app |> createRecord
                    setSuccessMessage "App created"
                    redirectTo AppsAction

    action DeleteAppAction { appId } = do
        app <- fetch appId
        deleteRecord app
        setSuccessMessage "App deleted"
        redirectTo AppsAction

buildApp app = app
    |> fill @'["name"]
