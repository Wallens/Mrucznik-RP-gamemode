//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ admini ]------------------------------------------------//
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

YCMD:admini(playerid, params[], help)
{
	if(IsPlayerConnected(playerid))
	{
		new string[128]; 
		SendClientMessage(playerid, -1, "Lista administrator�w na s�u�bie:"); 
		foreach(new i : Player)
		{
			if(GetPlayerAdminDutyStatus(i) == 1)
			{
				//GetPVarString(i, "pAdminDutyNickOff", FirstNickname, sizeof(FirstNickname));
				if(PlayerInfo[i][pAdmin] == 5000)
				{
					format(string, sizeof(string), "{FFFFFF}H@: {FF6A6A}%s {FFFFFF}[ID: %d]", GetNickEx(i), i);
				}
				else if(IsAScripter(i)) 
				{
					format(string, sizeof(string), "{FFFFFF}Skrypter: {747b41}%s {FFFFFF}[ID: %d]", GetNickEx(i), i);
				} 
				else if(PlayerInfo[i][pAdmin] >= 1 && PlayerInfo[i][pAdmin] != 5000)
				{
					format(string, sizeof(string), "{FFFFFF}Administrator: {FF6A6A}%s {FFFFFF}[ID: %d] [@LVL: %d]", GetNickEx(i), i, PlayerInfo[i][pAdmin]); 
				}
				else if(PlayerInfo[i][pNewAP] >= 1 && PlayerInfo[i][pNewAP] != 5)
				{
					format(string, sizeof(string), "{FFFFFF}P�-Admin: {00C0FF}%s {FFFFFF}[ID: %d] [P@LVL: %d]", GetNickEx(i), i, PlayerInfo[i][pNewAP]); 
				}
				sendTipMessage(playerid, string); 
			}
		}
		
	}
	return 1;
}
