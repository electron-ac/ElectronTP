Config = {}

local state = GetResourceState("ElectronAC")


-- If you want to automatically ban players that try to exploit events, you need to have ElectronAC installed.
--  Website: https://electron-ac.com/
Config.ElectronACIntegration = state == "started" or state == "starting"

-- Print a log message to the server console
Config.log = true