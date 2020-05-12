//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   unmark                                                  //
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
// Autor: mrucznik
// Data utworzenia: 12.05.2020


//

//------------------<[ Implementacja: ]>-------------------
command_unmark_Impl(playerid, giveplayerid)
{
    if(IsPlayerAdmin(playerid))
    {
        UnmarkPotentialCheater(giveplayerid);
        SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("Usun��e� gracza %s z listy potencjalnych cziter�w", GetNickEx(giveplayerid)));
        Log(adminLog, INFO, "Admin %s usun�� gracza %s z listy potencjalnych cziter�w.", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid));
    }
    return 1;
}

//end