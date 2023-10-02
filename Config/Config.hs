module Config where

import IHP.Prelude
import IHP.Environment
import IHP.FrameworkConfig
import qualified Network.Wai.Middleware.Cors as Cors

config :: ConfigBuilder
config = do
    -- See https://ihp.digitallyinduced.com/Guide/config.html
    -- for what you can do here
    -- option Development
    -- option (AppHostname "localhost")

    option Cors.simpleCorsResourcePolicy
    -- pure ()

