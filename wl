local webhookURL = "https://discord.com/api/webhooks/1322917960070725672/KcChCebwutGqrj9Rf8BZzGBkzAE01q_LIXIRkOMX8L1e1oCCaTqu8Jwo7I7mjHpBUtIh" 

local HttpService = game:GetService("HttpService")
local AnalyticsService = game:GetService("RbxAnalyticsService")

local hwid = AnalyticsService:GetClientId()

local function sendHWIDToDiscord(hwid)
    local data = {
        ["content"] = "HWID: " .. hwid
    }
    local jsonData = HttpService:JSONEncode(data)

    local success, response = pcall(function()
        return syn.request({
            Url = webhookURL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = jsonData
        })
    end)

    if not success then
        warn("Failed to send HWID: " .. tostring(response))
    else
        print("HWID sent successfully")
    end
end

sendHWIDToDiscord(hwid)
