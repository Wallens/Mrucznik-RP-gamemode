//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ dnobiekt ]-----------------------------------------------//
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

YCMD:dnobiekt(playerid, params[], help)
{
    if(PlayerInfo[playerid][pAdmin] >= 5000 || IsAScripter(playerid))
	{
	    new Float:oX;
	    new Float:oY;
	    new Float:oZ;
	    new Float:roX;
	    new Float:roY;
	    new Float:roZ;
	    new Float:soX;
	    new Float:soY;
	    new Float:soZ;
        new giveplayerid, index, obikt, kosc;
		if(sscanf(params, "k<fix>dddfffffffff", giveplayerid, index, obikt, kosc, oX, oY, oZ, roX, roY, roZ, soX, soY, soZ)) return 1;
		SetPlayerAttachedObject(giveplayerid,index,obikt, kosc, oX, oY, oZ, roX, roY, roZ, soX, soY, soZ); //kox
	}
	return 1;
}
