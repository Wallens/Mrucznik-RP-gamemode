//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ skinf ]-------------------------------------------------//
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

YCMD:skinf(playerid, params[], help)
{
    if(!IsPlayerConnected(playerid) || !gPlayerLogged[playerid]) return 1;
    if(GetPlayerFraction(playerid) == 0) return sendErrorMessage(playerid, "Nie jeste� we frakcji!");
    if(IsACop(playerid) || GetPlayerFraction(playerid) == FRAC_ERS || GetPlayerFraction(playerid) == FRAC_SN) return sendErrorMessage(playerid, "Twoja frakcja nie posiada tej komendy!");
	if(GetPlayerVehicleID(playerid) != 0) return sendErrorMessage(playerid, "Nie mo�esz znajdowa� si� w poje�dzie!");
	if(!IsAtClothShop(playerid)) return sendErrorMessage(playerid, "Nie znajdujesz si� w sklepie z ubraniami!");
    if(GetPVarInt(playerid, "skinF") == 0)
    {
        SetPVarInt(playerid, "skinF", 1);

        sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Przebra�e� si� w str�j frakcyjny");

        SetPlayerSkinEx(playerid, PlayerInfo[playerid][pSkin]);

        return 1;
    }
    else
    {
        SetPVarInt(playerid, "skinF", 0);

        sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Przebra�e� si� w str�j cywilny");

        SetPlayerSkinEx(playerid, PlayerInfo[playerid][pModel]);

        return 1;
    }
}
