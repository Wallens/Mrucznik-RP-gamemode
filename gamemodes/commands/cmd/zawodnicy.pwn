//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ zawodnicy ]-----------------------------------------------//
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

YCMD:zawodnicy(playerid, params[], help)
{
	new string[32];

    if(IsPlayerConnected(playerid))
    {
        SendClientMessage(playerid, COLOR_LIGHTGREEN, "Zawodnicy �u�lowi:");
		foreach(new i : Player)
		{
		    if(zawodnik[i] == 1)
		    {
		        new iplayer[MAX_PLAYER_NAME];
		        GetPlayerName(i, iplayer, sizeof(iplayer));
		        format(string, sizeof(string), "%s", iplayer);
				SendClientMessage(playerid, COLOR_WHITE, string);
		    }
		}
    }
	return 1;
}
