//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ pracownicy ]----------------------------------------------//
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

YCMD:pracownicy(playerid, params[], help)
{
    new frac = GetPlayerFraction(playerid);
	new string[64];
	if(frac > 0 && PlayerInfo[playerid][pRank] >= 4 && frac != FRAC_FBI)
	{
	    SendClientMessage(playerid, COLOR_GREEN, "Pracownicy Online:");
		foreach(new i : Player)
		{
		    if(frac == GetPlayerFraction(i))
		    {
		        format(string, sizeof(string), "{%06x}%s{B4B5B7} [%d] ranga %d", (GetPlayerColor(i) >>> 8), GetNick(i, true), i, PlayerInfo[i][pRank]);
		        SendClientMessage(playerid, COLOR_GRAD1, string);
		    }
		}
	}
	else if(frac == FRAC_FBI && PlayerInfo[playerid][pRank] >= 1)
	{
		SendClientMessage(playerid, COLOR_GREEN, "Pracownicy Online:");
		foreach(new i : Player)
		{
		    if(frac == GetPlayerFraction(i))
		    {
		        format(string, sizeof(string), "{%06x}%s{B4B5B7} [%d] ranga %d", (GetPlayerColor(i) >>> 8), GetNick(i, true), i, PlayerInfo[i][pRank]);
		        SendClientMessage(playerid, COLOR_GRAD1, string);
		    }
		}
	}
	else
	{
	    sendErrorMessage(playerid, "Nie jeste� liderem lub osob� z 4 rang�!");
	}
	return 1;
}
