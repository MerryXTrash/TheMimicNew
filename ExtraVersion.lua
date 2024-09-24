local games = {
	[6296321810 or 6479231833 or 6301638949 or 6480994221] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book1ch1.lua', --b1c1
	[6373539583 or 6485055338 or 6406571212 or 6485055836 or 6425178683 or 6485056556] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book1ch2.lua', --b1c2
	[6472459099 or 6688734180 or 6682163754 or 6688734313 or 6682164423 or 6688734395] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book1ch3.lua', --b1c3
	[7265396387 or 7251865082 or 7265396805 or 7251866503 or 7265397072 or 7251867155 or 7265397848 or 7251867574] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book1ch4.lua', --b1ch4
	[6243699076 or 15989427413 or 7068737459] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Lobby.lua', --lobby
	[7068738088 or 7068951438 or 7068951914 or 7068951914 or 7068740106 or 7068952294] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Thewitchtrial.lua', --twt
	[15996404472 or 15996407335 or 15996411979 or 15996410294 or 15996413469 or 15996414738 or 15996416081 or 15996417416] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Classic.lua', --classic
	[8056702588] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book2Ch1.lua', -- b2ch1
	[13489800654] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book2ch2.lua', --b2ch2
	[15962819441] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book2ch3.lua', --b2ch3
	[8311302084 or 8311299084] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Xmas.lua', --Xmas
	[11126398230] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Nightmarecircus.lua', --nightmarecircus
	[7618863566] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Jigoku.lua' --Jigoku
}

local currentPlaceId = game.PlaceId
local gameUrl = games[currentPlaceId]
if gameUrl then
	loadstring(game:HttpGet(gameUrl))()
end
