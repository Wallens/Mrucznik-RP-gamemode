//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ getvw ]-------------------------------------------------//
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

YCMD:getvw(playerid, params[], help)
{
	new gracz, string[64];
	if( sscanf(params, "k<fix>", gracz))
	{
		sendTipMessage(playerid, "U�yj /getvw [nick/id]");
		return 1;
	}

	if(!IsPlayerConnected(gracz))
	{
		sendErrorMessage(playerid, "Nie ma takiego gracza.");
		return 1;
	}

	if (PlayerInfo[playerid][pAdmin] >= 1 || IsAScripter(playerid))
	{
		format(string, sizeof(string), "VirutalWorld gracza %s to %d.", GetNick(gracz), GetPlayerVirtualWorld(gracz));
		SendClientMessage(playerid, COLOR_GRAD1, string);
	}
	else
	{
		noAccessMessage(playerid);
	}
	return 1;
}

