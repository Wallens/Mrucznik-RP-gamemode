//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ getposp ]------------------------------------------------//
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

YCMD:getposp(playerid, params[], help)
{
	new string[64];

    if(PlayerInfo[playerid][pAdmin] >= 1 || IsAScripter(playerid))
	{
	    new giveplayerid;
		if( sscanf(params, "k<fix>", giveplayerid))
		{
			sendTipMessage(playerid, "U�yj /getposp [id gracza]");
			return 1;
		}

		new Float:gx, Float:gy, Float:gz;
		GetPlayerPos(giveplayerid, gx, gy, gz);
		format(string, sizeof(string), "Pozycja: %.2f, %.2f, %.2f", gx, gy, gz);
		SendClientMessage(playerid, COLOR_WHITE, string);
	}
	return 1;
}
