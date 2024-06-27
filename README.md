# Electron Trigger Protector

A easy-to use open-source resource to protect your FiveM server's events.

## How it works

When you create a new trigger with, RegisterNetEventSecured, the name of the trigger will be randomized/abscoured.
When triggering it with TriggerServerEventSecured, there will also be a randomized number attached, this makes it more difficult to execute triggers from menu's.

```lua
TriggerServerEvent -> TriggerServerEventSecured
RegisterNetEvent -> RegisterNetEventSecured
AddEventHandler -> AddEventHandlerSecured 
```
# IMportant note
ElectronTP **needs** to be started berfore other scripts try to use it.

# How to use

https://docs.electron-ac.com/trigger-protector/usage

# Integration

It's possible to integrate this resource into Electron Anticheat to also automatically ban players abusing triggers
