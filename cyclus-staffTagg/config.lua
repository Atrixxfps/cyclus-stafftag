Cyclus = {}

-- Framework & Staff-tag settings
Cyclus = {
    VersionCheck = 'legacy', -- 'legacy' ESX Legacy (1.9.0 or +)  |  'old' ESX outdated (1.7.5 or -)  |  'qb' QB-verions
    commandName = 'staff-tag', -- Name of the command to show/hide the staff-tag
    commandKey = 'F10', -- Key to show/hide the staff-tag
    settingsTag = {
        {
            groupCheck = 'admin', -- Admin group that checks if the client is a valid staff-member
            nameTag = '~f~[STAFF]~w~', -- Text with colors displayed in the drawtext
            distanceTag = 10 -- Distance between staff-tag user and other players
        }
    }
}