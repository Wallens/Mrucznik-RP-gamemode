//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ zawodnik ]-----------------------------------------------//
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

YCMD:zawodnik(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
		new para1;
		if( sscanf(params, "k<fix>", para1))
		{
			sendTipMessage(playerid, "U�yj /zawodnik [playerid/Cz��Nicku]");
			return 1;
		}

		GetPlayerName(playerid, sendername, sizeof(sendername));

		if (PlayerInfo[playerid][pAdmin] >= 5 || PlayerInfo[playerid][pMember] == 9 && PlayerInfo[playerid][pRank] >= 2  || strcmp(sendername,"Gonzalo_DiNorscio", false) == 0)
		{
		    if(IsPlayerConnected(para1))
		    {
		        if(para1 != INVALID_PLAYER_ID)
		        {
		            if(zawodnik[para1] != 1)
		            {
						GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						printf("AdmCmd: %s da� zawodnika �u�lowego graczowi %s.", sendername, giveplayer);
						SendClientMessage(para1, COLOR_LIGHTBLUE, "   Jeste� teraz zawodnikiem �u�lowym, bierz sw�j motor");
						format(string, sizeof(string), "   Gracz %s jest teraz zawodnikiem �u�lowym.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						zawodnik[para1] = 1;
						format(string, sizeof(string), "Mamy nowego zawodnika �u�lowego - %s !!.", giveplayer);
						ProxDetectorW(500, -1106.9854, -966.4719, 129.1807, COLOR_WHITE, string);
					}
					else
					{
					    GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						printf("AdmCmd: %s zabra� zawodnika �u�lowego graczowi %s.", sendername, giveplayer);
						SendClientMessage(para1, COLOR_LIGHTBLUE, "   Ju� nie jestes zawodnikiem �u�lowym, id� na trybuny");
						format(string, sizeof(string), "   Zabra�e� graczowi %s zawodnika �u�lowego.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						zawodnik[para1] = 0;
						format(string, sizeof(string), "Zawodnik �u�lowy %s odpad� podczas wy�cigu.", giveplayer);
						ProxDetectorW(500, -1106.9854, -966.4719, 129.1807, COLOR_WHITE, string);
					}
				}
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
	}
	return 1;
}
