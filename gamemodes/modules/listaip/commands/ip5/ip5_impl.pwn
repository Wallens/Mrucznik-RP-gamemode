//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                ip5                                                //
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
// Autor: NikodemBanan
// Data utworzenia: 20.03.2024


//

//------------------<[ Implementacja: ]>-------------------
command_ip5_Impl(playerid, giveplayer[], offline)
{
    new giveplayername[MAX_PLAYER_NAME];

    if (PlayerInfo[playerid][pAdmin] <= 0)
    {
        noAccessMessage(playerid);
        return 1;
    }

    if(!offline)
    {
        new giveplayerid = giveplayer[0];

        if(!IsPlayerConnected(giveplayerid))
        {
            sendErrorMessage(playerid, "Nie znaleziono gracza o nicku/id podanym w parametrze.");
            return 1;
        }

        GetPlayerName(giveplayerid, giveplayername, sizeof(giveplayername));
    }
    else
    {
        format(giveplayername, sizeof(giveplayername), "%s", giveplayer);
    }

    IP5ShowIPListStr(playerid, giveplayername);
    Log(adminLog, INFO, "Admin %s u�y� /ip5 na graczu %s", GetPlayerLogName(playerid), giveplayername);

    return 1;
}

//end