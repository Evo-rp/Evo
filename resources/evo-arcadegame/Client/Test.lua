CreateThread(function()
    print('[DEV] Debug unloading arcade.')
    GameData = {}
    LocalPlayer.state.inArcade = false
end)

RegisterCommand('CHECK_CLIENT_GAME_DATA', function()
    print(json.encode(GameData, {indent = true}))
end)