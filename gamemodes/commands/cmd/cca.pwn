//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ cca ]--------------------------------------------------//
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:cca(playerid, params[], help)
{
	new string[64];
	new sendername[MAX_PLAYER_NAME];

	if(PlayerInfo[playerid][pAdmin] >= 5 || IsAScripter(playerid))
	{
		for(new i = 0; i<200; i++)
			SendClientMessageToAll(COLOR_GREY," ");
        SendClientMessageToAll(COLOR_LIGHTRED,"=== Czat zosta� wyczyszczony ===");
        GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s [ID: %d] uzyl /cca", sendername, playerid);
		ABroadCast(COLOR_PANICRED,string,1);
        SendCommandLogMessage(string);
		printf(string);
	}
	return 1;
}

