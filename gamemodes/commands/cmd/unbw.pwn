//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//--------------------------------------------------[ unbw ]-------------------------------------------------//
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

YCMD:unbw(playerid, p[], help)
{
    if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] >= 1)
	{
		new id;
		if(sscanf(p, "k<fix>", id)) return sendTipMessage(playerid, "U�yj /unbw [ID]");
		if(PlayerInfo[id][pBW] == 0) return sendTipMessageEx(playerid, COLOR_GRAD2, "Ten gracz nie ma BW.");
		PlayerInfo[id][pBW] = 2;
		SendClientMessage(playerid, COLOR_GRAD2, "Zdj�to BW");
	}
	else
	{
		sendErrorMessage(playerid, "Nie masz uprawnie�.");
	}
    return 1;
}
