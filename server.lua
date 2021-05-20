LimitCache = {}
KorumaliEventler = {
    ["muzik-cal"] = 2,
    ["muzik-durdur"] = 10,
    ["muzik-duraklat"] = 10,
    ["muzik-devamet"] = 10,
}

for event,limit in pairs(KorumaliEventler) do
    RegisterServerEvent(event)
    AddEventHandler(event, function(...)
        local _source = source
        if LimitCache[_source] then
            if LimitCache[_source] > limit then
                DropPlayer(_source,event.." limitine vurdunuz. Hileci değilseniz tekrar girin, hileciyseniz... başka methodlarda görüşmek üzere.")
            else
                LimitCache[_source] = LimitCache[_source] + 1
            end
        else
            LimitCache[_source] = 1
        end
    end)
end