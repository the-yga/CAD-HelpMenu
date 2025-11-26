local ESX = exports.es_extended:getSharedObject()

RegisterCommand('help', function()
    local playerName = GetPlayerName(PlayerId())
    local options = {}

    options[#options + 1] = {
        title = "Who am I? " .. playerName,
        icon = 'user',  
        disabled = false 
    }

    for _, tutorial in pairs(Config.Tutorials) do
        options[#options + 1] = {
            title = tutorial.label,
            description = "Learn more about " .. tutorial.label,
            icon = tutorial.icon or 'book',  
            event = "helpMenu:openSub",
            args = { tutorial = tutorial }
        }
    end
    options[#options + 1] = {
        title = 'Script Infromation...',
        description = "This Script maked by YGA and all license of this script and this Idea for YGA | Discord : y_g_a",
        icon = 'pills',  
    }

    lib.registerContext({
        id = 'help_main',
        title = 'Welcome to '..Config.ServerName,
        options = options
    })
    lib.showContext('help_main')
end)

RegisterNetEvent('helpMenu:openSub', function(data)
    local tutorial = data.tutorial
    lib.registerContext({
        id = 'help_sub_' .. tutorial.id,
        title = tutorial.label,
        menu = 'help_main',
        options = {
            {
                title = 'Watch Video',
                description = 'Play tutorial video',
                icon = 'play', 
                event = 'helpMenu:watchVideo',
                args = tutorial.video
            },
            {
                title = 'Watch Picture',
                description = 'Show tutorial image',
                icon = 'image',  
                event = 'helpMenu:watchPicture',
                args = tutorial.picture
            },
            {
                title = 'See Text',
                description = 'Read tutorial guide',
                icon = 'file-text',  
                event = 'helpMenu:seeText',
                args = tutorial.text
            },
        }
    })
    lib.showContext('help_sub_' .. tutorial.id)
end)
RegisterNetEvent('helpMenu:seeText', function(text)
    lib.registerContext({
        id = 'help_text',
        title = 'Tutorial Text',
        menu = 'help_main',
        options = {
            {
                title = text,
                icon = 'file-text', 
                disabled = false
            }
        }
    })
    lib.showContext('help_text')
end)
RegisterNetEvent('helpMenu:watchPicture', function(url)
    exports['CAD-PictureLoader']:ShowImage(url)
end)
RegisterNetEvent('helpMenu:watchVideo', function(url)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'showVideo',
        video = url
    })
end)
RegisterNUICallback('closeVideo', function()
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'hideVideo' })
end)


















