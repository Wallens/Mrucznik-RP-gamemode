//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ linie ]-------------------------------------------------//
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

YCMD:linie(playerid, p[], help)
{
    if(IsPlayerInFraction(playerid, FRAC_SN, 1000))
    {
        new lStr[64], bool:lSent=true;
        for(new i=0;i<51;i++)
        {
            if(!gSNLockedLine[i])
            {
                lSent=false;
                format(lStr, 64, "%s%d ", lStr, i+100);
                if(strlen(lStr) > 58)
                {
                    lSent=true;
                    SendClientMessage(playerid, COLOR_GREEN, lStr);
                    strdel(lStr, 0, 64);
                }
            }
        }
        if(!lSent)
        {
            SendClientMessage(playerid, COLOR_GREEN, lStr);
        }
    }
    else sendErrorMessage(playerid, "Nie jeste� z SN.");
    return 1;
}
