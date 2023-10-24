module Web.Controller.PlayResults where

import Web.Controller.Prelude
import Web.View.PlayResults.Index
import Web.View.PlayResults.New
import Web.View.PlayResults.Edit
import Web.View.PlayResults.Show

instance Controller PlayResultsController where
    action PlayResultsAction = do
        playResults <- query @PlayResult |> fetch
        render IndexView { .. }

    action NewPlayResultAction = do
        let playResult = newRecord
        render NewView { .. }

    action ShowPlayResultAction { playResultId } = do
        playResult <- fetch playResultId
        render ShowView { .. }

    action EditPlayResultAction { playResultId } = do
        playResult <- fetch playResultId
        render EditView { .. }

    action UpdatePlayResultAction { playResultId } = do
        playResult <- fetch playResultId
        playResult
            |> buildPlayResult
            |> ifValid \case
                Left playResult -> render EditView { .. }
                Right playResult -> do
                    playResult <- playResult |> updateRecord
                    setSuccessMessage "PlayResult updated"
                    redirectTo EditPlayResultAction { .. }

    action CreatePlayResultAction = do
        let playResult = newRecord @PlayResult
        playResult
            |> buildPlayResult
            |> ifValid \case
                Left playResult -> render NewView { .. } 
                Right playResult -> do
                    playResult <- playResult |> createRecord
                    setSuccessMessage "PlayResult created"
                    redirectTo PlayResultsAction

    action DeletePlayResultAction { playResultId } = do
        playResult <- fetch playResultId
        deleteRecord playResult
        setSuccessMessage "PlayResult deleted"
        redirectTo PlayResultsAction

buildPlayResult playResult = playResult
    |> fill @["consent", "playData", "playerName", "appName"]
