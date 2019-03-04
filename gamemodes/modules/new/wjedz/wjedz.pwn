//MODULE_NAME.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//---------------------------------------[ Modu�: MODULE_NAME.pwn ]------------------------------------------//
//Opis:
/*

*/
//Adnotacje:
/*

*/
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

//

//-----------------<[ Funkcje: ]>-------------------
stock StworzWjedz(playerid, Float:wjedzX, Float:wjedzY, Float:wjedzZ, Float:wyjedzX, Float:wyjedzY, Float:wyjedzZ, Float:RangePoint, VW, MessageIN[]=" ", MessageOut[]=" ", FracOwner=0, OrgOwner=0, local)
{
	wjazdy[valueWjedz][wj_X] = wjedzX;
	wjazdy[valueWjedz][wj_Y] = wjedzY;
	wjazdy[valueWjedz][wj_Z] = wjedzZ;
	wjazdy[valueWjedz][wy_X] = wyjedzX;
	wjazdy[valueWjedz][wy_Y] = wyjedzY;
	wjazdy[valueWjedz][wy_Z] = wyjedzZ;
	wjazdy[valueWjedz][wj_VW] = VW;
	wjazdy[valueWjedz][wj_PLOCAL] = local;
	wjazdy[valueWjedz][pFracOwn] = FracOwner;
	wjazdy[valueWjedz][pOrgOwn] = OrgOwner;
	wjazdy[valueWjedz][RangeofPoint] = RangePoint;

	CreateDynamicPickup(1239, 2, wjedzX, wjedzY, wjedzZ, 0, 0);
	CreateDynamicPickup(1239, 2, wyjedzX, wyjedzY, wyjedzZ, VW, 0);
	
	
	
	return iloscwjedz++;
}
stock SprawdzWjazdy(playerid)
{
	new playerVehicleID = GetPlayerVehicleID(playerid);
	new pSeatID = GetPlayerVehicleSeat(playerid);
	for(new i; i<valueWjedz; i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, wjazdy[i][RangeofPoint], wjazdy[i][wj_X], wjazdy[i][wj_Y], wjazdy[i][wj_Z]))
		{
			if(IsPlayerInAnyVehicle(playerid))
			{
				if(wjazdy[i][pFracOwn] == 0 && wjazdy[i][pOrgOwn] == 0)
				{
				/*	if(strlen(MessageIN) >= 1)
					{
						sendTipMessage(playerid, MessageIN);
					}*/
					SetVehiclePos(playerVehicleID, wjazdy[i][wy_X], wjazdy[i][wy_Y], wjazdy[i][wy_Z]);
					SetVehicleVirtualWorld(playerVehicleID, wjazdy[i][wj_VW]);
					SetPlayerVirtualWorld(playerid, wjazdy[i][wj_VW]);
					PutPlayerInVehicle(playerid, playerVehicleID, pSeatID);
					PlayerInfo[playerid][pLocal] = wjazdy[i][wj_PLOCAL];
					foreach(Player, i2)
					{
						if(IsPlayerInVehicle(i2, playerVehicleID))
						{
							pSeatID = GetPlayerVehicleSeat(i2);
							SetPlayerVirtualWorld(i2, wjazdy[i][wj_VW]);
							SetVehicleVirtualWorld(playerVehicleID, wjazdy[i][wj_VW]);
							SetVehiclePos(playerVehicleID, wjazdy[i][wy_X], wjazdy[i][wy_Y], wjazdy[i][wy_Z]);
							PutPlayerInVehicle(i2, playerVehicleID, pSeatID);
							PlayerInfo[i2][pLocal] = wjazdy[i][wj_PLOCAL];
						}
					}
					return 1;
				}
				if(wjazdy[i][pFracOwn] > 0 && wjazdy[i][pOrgOwn] == 0)
				{
					if(GetPlayerFraction(playerid) == wjazdy[i][pFracOwn])
					{
						SetVehiclePos(playerVehicleID, wjazdy[i][wy_X], wjazdy[i][wy_Y], wjazdy[i][wy_Z]);
						SetVehicleVirtualWorld(playerVehicleID, wjazdy[i][wj_VW]);
						SetPlayerVirtualWorld(playerid, wjazdy[i][wj_VW]);
						PutPlayerInVehicle(playerid, playerVehicleID, pSeatID);
						PlayerInfo[playerid][pLocal] = wjazdy[i][wj_PLOCAL];
						foreach(Player, i2)
						{
							pSeatID = GetPlayerVehicleSeat(i2);
							SetPlayerVirtualWorld(i2, wjazdy[i][wj_VW]);
							SetVehicleVirtualWorld(playerVehicleID, wjazdy[i][wj_VW]);
							SetVehiclePos(playerVehicleID, wjazdy[i][wy_X], wjazdy[i][wy_Y], wjazdy[i][wy_Z]);
							PutPlayerInVehicle(i2, playerVehicleID, pSeatID);
							PlayerInfo[i2][pLocal] = wjazdy[i][wj_PLOCAL];
						}
					}
					else
					{
						sendErrorMessage(playerid, "Nie mo�esz tutaj wjecha�!"); 
					}
				}
				else if(wjazdy[i][pFracOwn] == 0 && wjazdy[i][pOrgOwn] > 0)
				{
					if(GetPlayerFraction(playerid) == wjazdy[i][pFracOwn])
					{
						SetVehiclePos(playerVehicleID, wjazdy[i][wy_X], wjazdy[i][wy_Y], wjazdy[i][wy_Z]);
						SetVehicleVirtualWorld(playerVehicleID, wjazdy[i][wj_VW]);
						SetPlayerVirtualWorld(playerid, wjazdy[i][wj_VW]);
						PutPlayerInVehicle(playerid, playerVehicleID, pSeatID);
						PlayerInfo[playerid][pLocal] = wjazdy[i][wj_PLOCAL];
						foreach(Player, i2)
						{
							pSeatID = GetPlayerVehicleSeat(i2);
							SetPlayerVirtualWorld(i2, wjazdy[i][wj_VW]);
							SetVehicleVirtualWorld(playerVehicleID, wjazdy[i][wj_VW]);
							SetVehiclePos(playerVehicleID, wjazdy[i][wy_X], wjazdy[i][wy_Y], wjazdy[i][wy_Z]);
							PutPlayerInVehicle(i2, playerVehicleID, pSeatID);
							PlayerInfo[i2][pLocal] = wjazdy[i][wj_PLOCAL];
						}
					}
					else
					{
						sendErrorMessage(playerid, "Nie mo�esz tutaj wjecha�!"); 
						return 1;
					}
				}
				else if(wjazdy[i][pFracOwn] > 0 && wjazdy[i][pOrgOwn] > 0)
				{
					if(GetPlayerFraction(playerid) == wjazdy[i][pFracOwn] || GetPlayerOrg(playerid) == wjazdy[i][pOrgOwn])
					{
						SetVehiclePos(playerVehicleID, wjazdy[i][wy_X], wjazdy[i][wy_Y], wjazdy[i][wy_Z]);
						SetVehicleVirtualWorld(playerVehicleID, wjazdy[i][wj_VW]);
						SetPlayerVirtualWorld(playerid, wjazdy[i][wj_VW]);
						PutPlayerInVehicle(playerid, playerVehicleID, pSeatID);
						PlayerInfo[playerid][pLocal] = wjazdy[i][wj_PLOCAL];
						foreach(Player, i2)
						{
							pSeatID = GetPlayerVehicleSeat(i2);
							SetPlayerVirtualWorld(i2, wjazdy[i][wj_VW]);
							SetVehicleVirtualWorld(playerVehicleID, wjazdy[i][wj_VW]);
							SetVehiclePos(playerVehicleID, wjazdy[i][wy_X], wjazdy[i][wy_Y], wjazdy[i][wy_Z]);
							PutPlayerInVehicle(i2, playerVehicleID, pSeatID);
							PlayerInfo[i2][pLocal] = wjazdy[i][wj_PLOCAL];
						}
					}
					else
					{
						sendErrorMessage(playerid, "Nie mo�esz tutaj wjecha�!"); 
					}
				}
				return 1;
			}
			if(IsPlayerInRangeOfPoint(playerid, wjazdy[i][RangeofPoint], wjazdy[i][wy_X], wjazdy[i][wy_Y], wjazdy[i][wy_Z]))
			{
				if(IsPlayerInAnyVehicle(playerid))
				{
					if(wjazdy[i][pFracOwn] == 0 && wjazdy[i][pOrgOwn] == 0)
					{
						pSeatID = GetPlayerVehicleSeat(playerid);
						SetVehiclePos(playerVehicleID, wjazdy[i][wj_X], wjazdy[i][wj_Y], wjazdy[i][wj_Z]);
						SetVehicleVirtualWorld(playerVehicleID, 0);
						SetPlayerVirtualWorld(playerid, 0);
						PutPlayerInVehicle(playerid, playerVehicleID, pSeatID);
						PlayerInfo[playerid][pLocal] = 255;
						foreach(Player, i2)
						{
							pSeatID = GetPlayerVehicleSeat(i2);
							SetPlayerVirtualWorld(i2, 0);
							SetVehicleVirtualWorld(playerVehicleID, 0);
							SetVehiclePos(playerVehicleID, wjazdy[i][wj_X], wjazdy[i][wj_Y], wjazdy[i][wj_Z]);
							PutPlayerInVehicle(i2, playerVehicleID, pSeatID);
							PlayerInfo[i2][pLocal] = 255;
						}
						return 1;
					}
					if(GetPlayerFraction(playerid) == wjazdy[i][pFracOwn] || GetPlayerOrg(playerid) == wjazdy[i][pOrgOwn])
					{
						pSeatID = GetPlayerVehicleSeat(playerid);
						SetVehiclePos(playerVehicleID, wjazdy[i][wj_X], wjazdy[i][wj_Y], wjazdy[i][wj_Z]);
						SetVehicleVirtualWorld(playerVehicleID, 0);
						SetPlayerVirtualWorld(playerid, 0);
						PutPlayerInVehicle(playerid, playerVehicleID, pSeatID);
						PlayerInfo[playerid][pLocal] = 255;
						foreach(Player, i2)
						{
							pSeatID = GetPlayerVehicleSeat(i2);
							SetPlayerVirtualWorld(i2, 0);
							SetVehicleVirtualWorld(playerVehicleID, 0]);
							SetVehiclePos(playerVehicleID, wjazdy[i][wj_X], wjazdy[i][wj_Y], wjazdy[i][wj_Z]);
							PutPlayerInVehicle(i2, playerVehicleID, pSeatID);
							PlayerInfo[i2][pLocal] = 255;
						}
					}
				}
			}
		}
	}
	return 0;
}

//------------------<[ MySQL: ]>--------------------
//-----------------<[ Komendy: ]>-------------------

//end
