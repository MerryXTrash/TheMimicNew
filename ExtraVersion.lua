local currentPlaceId = game.PlaceId

function notify(Section, Description, num)
    game.StarterGui:SetCore("SendNotification", {
        Title = Section;
        Text = Description;
        Duration = num;
    })
end

if currentPlaceId == 6296321810 or currentPlaceId == 6479231833 or currentPlaceId == 6301638949 or currentPlaceId == 6480994221 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book1ch1.lua'))()
elseif currentPlaceId == 6373539583 or currentPlaceId == 6485055338 or currentPlaceId == 6406571212 or currentPlaceId == 6485055836 or currentPlaceId == 6425178683 or currentPlaceId == 6485056556 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book1ch2.lua'))()
elseif currentPlaceId == 6472459099 or currentPlaceId == 6688734180 or currentPlaceId == 6682163754 or currentPlaceId == 6688734313 or currentPlaceId == 6682164423 or currentPlaceId == 6688734395 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book1ch3.lua'))()
elseif currentPlaceId == 7265396387 or currentPlaceId == 7251865082 or currentPlaceId == 7265396805 or currentPlaceId == 7251866503 or currentPlaceId == 7265397072 or currentPlaceId == 7251867155 or currentPlaceId == 7265397848 or currentPlaceId == 7251867574 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book1ch4.lua'))()
elseif currentPlaceId == 6243699076 or currentPlaceId == 15989427413 or currentPlaceId == 7068737459 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Lobby.lua'))()
elseif currentPlaceId == 7068738088 or currentPlaceId == 7068951438 or currentPlaceId == 7068951914 or currentPlaceId == 7068740106 or currentPlaceId == 7068952294 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Thewitchtrial.lua'))()
elseif currentPlaceId == 15996404472 or currentPlaceId == 15996407335 or currentPlaceId == 15996411979 or currentPlaceId == 15996410294 or currentPlaceId == 15996413469 or currentPlaceId == 15996414738 or currentPlaceId == 15996416081 or currentPlaceId == 15996417416 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Classic.lua'))()
elseif currentPlaceId == 8056702588 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book2Ch1.lua'))()
elseif currentPlaceId == 13489800654 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book2ch2.lua'))()
elseif currentPlaceId == 15962819441 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book2ch3.lua'))()
elseif currentPlaceId == 8311302084 or currentPlaceId == 8311299084 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Xmas.lua'))()
elseif currentPlaceId == 11126398230 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Nightmarecircus.lua'))()
elseif currentPlaceId == 7618863566 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Jigoku.lua'))()
else
     notify("Not Support", "Script not Support it Game.", 5)
end
