//-----------------------------------------------<< Source >>------------------------------------------------//
//                                             player_attachments                                            //
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
// Autor: Mrucznik
// Data utworzenia: 10.08.2019
//Opis:
/*
	Moduł odpowiedzialny za zarządzanie obiektami przyczepialnymi do gracza.
*/

//

//-----------------<[ Funkcje: ]>-------------------
AttachPlayerItem(playerid, modelid, bone, Float:fOffsetX = 0.0, Float:fOffsetY = 0.0, Float:fOffsetZ = 0.0, Float:fRotX = 0.0, Float:fRotY = 0.0, Float:fRotZ = 0.0, Float:fScaleX = 1.0, Float:fScaleY = 1.0, Float:fScaleZ = 1.0, materialcolor1 = 0, materialcolor2 = 0)
{
	new index = GetFreeAttachedObjectSlot(playerid);
	if(index == INVALID_ATTACHED_OBJECT_INDEX) return INVALID_ATTACHED_OBJECT_INDEX;
	
	AttachedObjects[playerid][index][ao_model] = modelid;
	AttachedObjects[playerid][index][ao_bone] = bone;
	AttachedObjects[playerid][index][ao_x] = fOffsetX;
	AttachedObjects[playerid][index][ao_y] = fOffsetY;
	AttachedObjects[playerid][index][ao_z] = fOffsetZ;
	AttachedObjects[playerid][index][ao_rx] = fRotX;
	AttachedObjects[playerid][index][ao_ry] = fRotY;
	AttachedObjects[playerid][index][ao_rz] = fRotZ;
	AttachedObjects[playerid][index][ao_sx] = fScaleX;
	AttachedObjects[playerid][index][ao_sy] = fScaleY;
	AttachedObjects[playerid][index][ao_sz] = fScaleZ;
	AttachedObjects[playerid][index][ao_active] = true;

	SetPlayerAttachedObject(playerid, index, modelid, bone, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ, materialcolor1, materialcolor2); 
	return index;
}

DetachPlayerItem(playerid, index)
{
	AttachedObjects[playerid][index][ao_active] = false;
	PlayerAttachments_SetActive(playerid, AttachedObjects[playerid][index][ao_model], false);
	RemovePlayerAttachedObject(playerid, index);
	return 1;
}

GetFreeAttachedObjectSlot(playerid)
{
	//slot 9 for gamemode items
	for(new i; i<MAX_PLAYER_ATTACHED_OBJECTS-1; i++) 
	{
		if(!IsPlayerAttachedObjectSlotUsed(playerid, i))
		{
			return i;
		}
	}
	return INVALID_ATTACHED_OBJECT_INDEX; 
}

PlayerHasAttachedObject(playerid, model)
{
	return VECTOR_find_val(VAttachedItems[playerid], model) != INVALID_VECTOR_INDEX;
}
//-----------------<[ Dialogi: ]>-------------------
DialogPlayerAttachedItems(playerid)
{
	DynamicGui_Init(playerid);

	new count, list[7*MAX_PREMIUM_ITEMS];
	VECTOR_foreach(i : VAttachedItems[playerid])
	{
		new item = MEM_get_val(i);
		strcat(list, sprintf("%d\n", item));
		count++;
		DynamicGui_AddRow(playerid, 1, item);
	}

	if(count==0) return sendErrorMessage(playerid, "Nie masz żadnych zakładalnych przedmiotów.");

	ShowPlayerDialogEx(playerid, DIALOG_PRZEDMIOTYGRACZA, DIALOG_STYLE_PREVIEW_MODEL, "Twoje przedmioty", list, "Ustaw", "Wyjdz");
	return 1;
}

DialogRemovePlayerAttachedItems(playerid)
{
	DynamicGui_Init(playerid);

	new count, list[7*MAX_PLAYER_ATTACHED_OBJECTS];
	for(new i; i<MAX_PLAYER_ATTACHED_OBJECTS; i++)
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid, i) && AttachedObjects[playerid][i][ao_active])
		{
			new item = AttachedObjects[playerid][i][ao_model];
			strcat(list, sprintf("%d\n", item));
			count++;
			DynamicGui_AddRow(playerid, 1, i);
		}
	}

	if(count==0) return sendErrorMessage(playerid, "Nie masz założonych przedmiotów.");

	ShowPlayerDialogEx(playerid, DIALOG_PRZEDMIOTYGRACZA_ZDEJMIJ, DIALOG_STYLE_PREVIEW_MODEL, "Twoje przedmioty", list, "Zdejmij", "Wyjdz");
	return 1;
}

//end