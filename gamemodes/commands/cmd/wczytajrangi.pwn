//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ wczytajrangi ]---------------------------------------------//
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

YCMD:wczytajrangi(playerid, params[], help)
{
    if(!Uprawnienia(playerid, ACCESS_OWNER)) return 1;
    SendClientMessage(playerid, -1, "Wczytuj� rangi.");
    WczytajRangi();
    //
    new str[32];
    for(new id=1;id<MAX_FRAC;id++)
    {
        if(strlen(FractionNames[id]) > 1)
        {
            format(str, 32, "%s", FractionNames[id]);
            SendClientMessage(playerid, -1, str);
            for(new i=0;i<MAX_RANG;i++)
            {
                if(strlen(FracRang[id][i]) > 1)
                {
                    SendClientMessage(playerid, -1, FracRang[id][i]);
                }
            }
        }
    }
    SendClientMessage(playerid, -1, "OK");
    return 1;
}

