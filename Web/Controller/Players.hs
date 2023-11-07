module Web.Controller.Players where

import Web.Controller.Prelude
import Web.View.Players.Index
import Web.View.Players.New
import Web.View.Players.Edit
import Web.View.Players.Show

instance Controller PlayersController where
    action PlayersAction = do
        players <- query @Player |> fetch
        render IndexView { .. }

    action NewPlayerAction = do
        let player = newRecord
        render NewView { .. }

    action ShowPlayerAction { playerId } = do
        player <- fetch playerId
        render ShowView { .. }

    action EditPlayerAction { playerId } = do
        player <- fetch playerId
        render EditView { .. }

    action UpdatePlayerAction { playerId } = do
        player <- fetch playerId
        player
            |> buildPlayer
            |> ifValid \case
                Left player -> render EditView { .. }
                Right player -> do
                    player <- player |> updateRecord
                    setSuccessMessage "Player updated"
                    redirectTo EditPlayerAction { .. }

    action CreatePlayerAction = do
        ensureIsUser
        let player = newRecord @Player
        player
            |> buildPlayer
            |> ifValid \case
                Left player -> render NewView { .. } 
                Right player -> do
                    player <- player |> createRecord
                    setSuccessMessage "Player created"
                    redirectTo PlayersAction

    action DeletePlayerAction { playerId } = do
        player <- fetch playerId
        deleteRecord player
        setSuccessMessage "Player deleted"
        redirectTo PlayersAction

buildPlayer player = player
    |> fill @'["name"]
