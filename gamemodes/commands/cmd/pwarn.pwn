//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ pwarn ]-------------------------------------------------//
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

YCMD:pwarn(playerid, params[], help)
{
	new string[128];
    if(IsPlayerConnected(playerid))
    {
        if (PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] >= 1)
		{
		    if(AntySpam[playerid] == 1)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "Odczekaj 5 sekund");
		        return 1;
		    }

	   		new nick[MAX_PLAYER_NAME], result[64];
			if( sscanf(params, "s[21]s[64]", nick, result))
			{
                sendTipMessage(playerid, "U�yj /pwarn [NICK GRACZA OFFLINE] [powod]");
                return 1;
            }
			new giveplayerid;
			sscanf(nick, "k<fix>", giveplayerid);
            if(IsPlayerConnected(giveplayerid))
			{
			    sendErrorMessage(playerid, "Nie mo�esz zablokowa� tego gracza (jest online (na serwerze))");
				return 1;
			}

			if(!MruMySQL_DoesAccountExist(nick))
			{
				sendErrorMessage(playerid, "Brak pliku gracza, nie mo�na zwarnowa� (konto nie istnieje).");
				return 1;
			}
			GivePWarnForPlayer(nick, playerid, result);
			if(kary_TXD_Status == 1)
			{
				PWarnPlayerTXD(nick, playerid, result);
			}
			else if(kary_TXD_Status == 0)
			{
				format(string, sizeof(string), "Admin %s nada� warna (offline) dla %s. Pow�d: %s", GetNick(playerid), nick, result);
				SendPunishMessage(string, playerid);
			}
        
		}
    }
	return 1;
}

