//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ zdmv ]-------------------------------------------------//
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


YCMD:zdmv(playerid, params[], help)
{
	new string[128];
	new sendername[MAX_PLAYER_NAME];

	if((IsAnInstructor(playerid) && PlayerInfo[playerid][pRank] >= 1))
	{
		if(dmv == 1)
		{
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "|____________Urz�d miasta zamkni�ty przez %s____________|", sendername);
			SendClientMessageToAll(COLOR_LIGHTGREEN, string);
			dmv = 0;
		}
		else
		{
			sendErrorMessage(playerid, "Urz�d jest zamkni�ty!"); 
		}
	}
	else
	{
		sendErrorMessage(playerid, "Nie jeste� instruktorem");
	}
	return 1;
}
