//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ dajdzwiek ]-----------------------------------------------//
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

CMD:dajdzwiek(playerid, params[])
{
    if(IsPlayerConnected(playerid))
    {
		if(PlayerInfo[playerid][pAdmin] >= 100)
		{
            new giveplayerid, level;
			if( sscanf(params, "k<fix>d", giveplayerid, level))
			{
				sendTipMessage(playerid, "U�yj /dajdzwiek [id gracza] [id dzwieku]");
				return 1;
			}
			PlayerPlaySound(giveplayerid, level, 0.0, 0.0, 0.0);
		}
    }
	return 1;
}
