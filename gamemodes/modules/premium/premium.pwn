//-----------------------------------------------<< Source >>------------------------------------------------//
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
// Data utworzenia: 04.05.2019
//Opis:
/*
	Monetyzacja, us�ugi premium.
*/

//

//-----------------<[ Include: ]>-------------------
#include "premium_dialogs.pwn"

//-----------------<[ Callbacki: ]>-----------------
//-----------------<[ Funkcje: ]>-------------------
premium_ConvertToNewSystem(playerid)
{
	if(PlayerInfo[playerid][pDonateRank] != 0)
	{
		DajKP(playerid, gettime()+KP_3_MIESIACE, false); // KP na 3 msc dla os�b, kt�re mieli premiuma na starym systemie
		DajMC(playerid, 500); // i jeszcze prezent...

		_MruGracz(playerid, "Uwaga! Twoje premium zosta�o przeniesione na nowy system!");
		_MruGracz(playerid, "Otrzyma�e� Konto Premium na 3 miesi�ce i dodatkowe 500 MC do wykorzystania.");

		Log(premiumLog, INFO, "%s otrzyma� konwersje KP %d na nowy system", GetPlayerLogName(playerid), PlayerInfo[playerid][pDonateRank]);
		PlayerInfo[playerid][pDonateRank] = 0;
	}
}

premium_clearCache(playerid)
{
	PremiumInfo[playerid][pMC] = 0;
	PremiumInfo[playerid][pKP] = 0;
	PremiumInfo[playerid][pExpires] = 0;

	for(new i; i<MAX_PREMIUM_SKINS; i++)
	{
		UniqueSkins[playerid][i] = false;
	}
}

premium_loadForPlayer(playerid)
{

	if(PlayerInfo[playerid][pDonateRank] != 0)
	{
		premium_ConvertToNewSystem(playerid);
	}

	new qr[256], kpMC, kpStarted, kpEnds, kpLastLogin, kpActive;

	format(qr, sizeof(qr), "SELECT `p_MC`, UNIX_TIMESTAMP(`p_endDate`), UNIX_TIMESTAMP(`p_startDate`), UNIX_TIMESTAMP(`p_LastCheck`), `p_activeKp` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
	mysql_query(qr);
	mysql_store_result();
	{
		mysql_fetch_row_format(qr, "|");
        mysql_free_result();
        sscanf(qr, "p<|>ddddd", kpMC, kpEnds, kpStarted, kpLastLogin, kpActive);


        if(kpActive)
        {
        	new shouldEnd = kpEnds-(gettime()+3600);
			if(kpEnds != 0 && shouldEnd <= 0)
			{
			    sendErrorMessage(playerid, "Twoje konto premium wygas�o!");
			    PremiumInfo[playerid][pKP] = 0;
			    ZabierzKP(playerid);
			}
			else
			{
				new lVal = kpEnds-gettime();

				if(lVal < KP_TYDZIEN)
				{
					format(qr, 170, "UWAGA! Twoje konto premium wygasa za %d dni i %d godzin.", floatround(floatdiv(lVal, 86400), floatround_floor), floatround(floatdiv(lVal, 3600), floatround_floor)%24);
					_MruAdmin(playerid, qr);
				}
				else
				{
					_MruAdmin(playerid, "Jeste� posiadaczem konta premium! :)");
				}
				PremiumInfo[playerid][pKP] = 1;
			}
			if(IsPlayerPremium(playerid)) PremiumInfo[playerid][pExpires] = kpEnds;
        }

        if(kpMC > 0) PremiumInfo[playerid][pMC] = kpMC;
        
	}

	format(qr, sizeof(qr), "SELECT `s_ID` FROM `mru_premium_skins` WHERE `s_charUID`='%d'", PlayerInfo[playerid][pUID]);
	mysql_query(qr);
	new skinID;
	mysql_store_result();
	{
		if(mysql_num_rows()>0)
		{
			while(mysql_fetch_row_format(qr, "|"))
			{
				sscanf(qr, "p<|>d", skinID);

				for(new i; i<MAX_PREMIUM_SKINS; i++)
					if(SkinyPremium[i][Model] == skinID)
						UniqueSkins[playerid][i] = true;
			}
		}
        mysql_free_result();
	}
}

premium_saveMc(playerid)
{
	new query[128];
    format(query, sizeof(query), "SELECT `p_charUID` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
	mysql_query(query);
	mysql_store_result();
    if(mysql_num_rows())
    {
        mysql_free_result();
        format(query, sizeof(query), "UPDATE `mru_premium` SET `p_MC`='%d' WHERE `p_charUID`='%d'", PremiumInfo[playerid][pMC], PlayerInfo[playerid][pUID]);
        mysql_query(query);
    }
    else
    {
        mysql_free_result();
        if(PremiumInfo[playerid][pMC] > 0)
        {
            format(query, sizeof(query), "INSERT INTO `mru_premium` (`p_charUID`, `p_MC`) VALUES('%d', '%d')", PlayerInfo[playerid][pUID], PremiumInfo[playerid][pMC]);
            mysql_query(query);
        }
    }
}

premium_printMcQuantity(playerid)
{
	return _MruGracz(playerid, sprintf("Aktualnie na Twoim koncie znajduje si� %d MruCoins.", PremiumInfo[playerid][pMC]));
}

ZabierzKP(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		Log(premiumLog, E_LOGLEVEL:DEBUG, "%s zabrano KP", GetPlayerLogName(playerid));
		PremiumInfo[playerid][pKP] = 0;
		new query[128];
		format(query, sizeof(query), "SELECT `p_charUID` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
    	mysql_query(query);
    	mysql_store_result();
        if(mysql_num_rows())
        {
            format(query, sizeof(query), "UPDATE `mru_premium` SET `p_activeKp`=0, `p_endDate`=NOW() WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
            mysql_query(query);
        }
        else
        {
        	Log(premiumLog, ERROR, "ERROR: ZabierzKP zosta�o wykonane na osobie, kt�ra nie posiada�a premium! %s", GetPlayerLogName(playerid));
        }
	}
}

DajKP(playerid, time, bool:msg=true)
{
	if(IsPlayerConnected(playerid))
    {
		Log(premiumLog, E_LOGLEVEL:DEBUG, "%s nadano KP na %d", GetPlayerLogName(playerid), time);
        new query[170];
        format(query, sizeof(query), "SELECT `p_charUID` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
    	mysql_query(query);
    	mysql_store_result();
        if(mysql_num_rows())
        {
            format(query, sizeof(query), "UPDATE `mru_premium` SET `p_endDate`=FROM_UNIXTIME('%d'), `p_startDate`=NOW(), `p_LastCheck`=NOW(), `p_activeKp`=1 WHERE `p_charUID`='%d'", time, PlayerInfo[playerid][pUID]);
            mysql_query(query);
        }
        else
        {
            format(query, sizeof(query), "INSERT INTO `mru_premium` (`p_endDate`, `p_charUID`, `p_LastCheck`, `p_startDate`, `p_activeKp`) VALUES(FROM_UNIXTIME('%d'), '%d', NOW(), NOW(), 1)", time, PlayerInfo[playerid][pUID]);
            mysql_query(query);
        }
        mysql_free_result();

        new lVal = time-gettime();

        if(lVal > 0 && time != 0)
        {
        	if(msg)
        	{
	            format(query, 170, "Otrzyma�e� Konto Premium. Wygasa ono za %d dni i %d godzin.", floatround(floatdiv(lVal, 86400), floatround_floor), floatround(floatdiv(lVal, 3600), floatround_floor)%24);
	            _MruAdmin(playerid, query);
        	}

			PremiumInfo[playerid][pExpires] = time;

            PremiumInfo[playerid][pKP] = 1;
        }
        else if(time == 0)
        {
            _MruAdmin(playerid, "Otrzyma�e� konto Premium na czas nieokre�lony.");

            PremiumInfo[playerid][pKP] = 1;
        }
    }
}

DajMC(playerid, mc)
{
	Log(premiumLog, E_LOGLEVEL:DEBUG, "%s nadano %dMC", GetPlayerLogName(playerid), mc);
	if(mc <= 0)
	{
		Log(premiumLog, ERROR,"ERROR: funkcja DajMC miala ujemna wartosc dla %s Wartosc: %d", GetPlayerLogName(playerid), mc);
		return 0;
	}
	PremiumInfo[playerid][pMC] += mc;

	premium_saveMc(playerid);

	return 1;
}

ZabierzMC(playerid, mc)
{
	Log(premiumLog, E_LOGLEVEL:DEBUG, "%s zabrano %dMC", GetPlayerLogName(playerid), mc);
	if(mc <= 0)
	{
		Log(premiumLog, ERROR, "ERROR: funkcja ZabierzMC miala ujemna wartosc dla %s", GetPlayerLogName(playerid), mc);
		return 0;
	}
	PremiumInfo[playerid][pMC] -= mc;

	premium_saveMc(playerid);

	return 1;
}

KupKP(playerid)
{
	ZabierzMC(playerid, MIESIAC_KP_CENA);
	DajKP(playerid, gettime()+KP_MIESIAC);
	SendClientMessage(playerid, COLOR_LIGHTGREEN, "Gratulacj�! Zakupi�e� konto premium. Od teraz masz dost�p do mo�liwo�ci premium. Dzi�kujemy za wspieranie serwera!"); 
}

PrzedluzKP(playerid)
{
	ZabierzMC(playerid, PRZEDLUZ_KP_CENA);
	DajKP(playerid, PremiumInfo[playerid][pExpires]+KP_MIESIAC);
	SendClientMessage(playerid, COLOR_LIGHTGREEN, "Konto premium przed�u�one :D!"); 
}

KupPojazdPremium(playerid, id)
{
	if(!(id < MAX_PREMIUM_VEHICLES && id >= 0))
	{
		DialogPojazdyPremium(playerid);
		return 1;
	}
	if(PremiumInfo[playerid][pMC] < PojazdyPremium[id][Cena])
	{
		sendErrorMessage(playerid, "Nie sta� Ci� na ten pojazd");
		return DialogPojazdyPremium(playerid);
	}
	MRP_ShopPurchaseCar(playerid, PojazdyPremium[id][Model], PojazdyPremium[id][Cena]);
	Log(premiumLog, INFO, "%s kupil pojazd premium %s za %dMC",
		GetPlayerLogName(playerid), 
		VehicleNames[PojazdyPremium[id][Model]-400], 
		PojazdyPremium[id][Cena]);
	premium_printMcQuantity(playerid);
	DialogMenuDotacje(playerid);
	return 1;
}

KupSkinPremium(playerid, skin)
{
	new id = -1;

	for(new i; i<MAX_PREMIUM_SKINS; i++)
	{
		if(SkinyPremium[i][Model] == skin)
		{
			id = i;
			break;
		}
	}

	if(id==-1) return DialogSkiny(playerid);

	if(PremiumInfo[playerid][pMC] < UNIKATOWY_SKIN_CENA)
	{
		sendErrorMessage(playerid, "Nie sta� Ci� na ten skin");
		return DialogSkiny(playerid);
	}

	new string[128];

	format(string, sizeof(string), "INSERT INTO `mru_premium_skins` (`s_charUID`, `s_ID`) VALUES('%d', '%d')", PlayerInfo[playerid][pUID], SkinyPremium[id][Model]);
    mysql_query(string);

	Log(premiumLog, INFO, "%s kupi� unikatowy skin %d za %dMC",
		GetPlayerLogName(playerid), 
		SkinyPremium[id][Model], 
		UNIKATOWY_SKIN_CENA);

	UniqueSkins[playerid][id] = true;

	ZabierzMC(playerid, UNIKATOWY_SKIN_CENA);

	_MruAdmin(playerid, sprintf("Gratulujemy dobrego wyboru. Kupi�e� skin o ID %d za %d MC.", SkinyPremium[id][Model], UNIKATOWY_SKIN_CENA));
	_MruAdmin(playerid, "List� swoich skin�w premium znajdziesz pod komend� /skiny");

	premium_printMcQuantity(playerid);

	return 1;
}

KupSlotPojazdu(playerid)
{
	if(!IsPlayerConnected(playerid)) return 1;

	if(PremiumInfo[playerid][pMC] < CAR_SLOT_CENA)
	{
		sendErrorMessage(playerid, "Nie sta� Ci� na zakup dodatkowego slotu.");
		return DialogSlotyPojazdu(playerid);
	}

	if(MRP_GetPlayerCarSlots(playerid) >= 10)
	{
		sendErrorMessage(playerid, "Masz ju� maksymaln� ilo�� slot�w.");
		return DialogMenuDotacje(playerid);
	}

	ZabierzMC(playerid, CAR_SLOT_CENA);
	MRP_SetPlayerCarSlots(playerid, MRP_GetPlayerCarSlots(playerid)+1);

	Log(premiumLog, INFO, "%s kupi� slot wozu za "#CAR_SLOT_CENA"MC",
		GetPlayerLogName(playerid));
	_MruAdmin(playerid, sprintf("Kupi�e� sobie slot na auto za %d MC. Masz teraz %d slot�w.", CAR_SLOT_CENA, MRP_GetPlayerCarSlots(playerid)));

	premium_printMcQuantity(playerid);
	DialogMenuDotacje(playerid);
	return 1;
}

KupZmianeNicku(playerid)
{
	if(!IsPlayerConnected(playerid)) return 1;

	if(PremiumInfo[playerid][pMC] < ZMIANA_NICKU_CENA)
	{
		sendErrorMessage(playerid, "Nie sta� Ci� na zakup dodatkowej zmiany nicku");
		return DialogZmianyNicku(playerid);
	}

	ZabierzMC(playerid, ZMIANA_NICKU_CENA);
	MRP_SetPlayerNickChanges(playerid, MRP_GetPlayerNickChanges(playerid)+1);

	Log(premiumLog, INFO, "%s kupil zmiane nicku za "#ZMIANA_NICKU_CENA"MC",
		GetPlayerLogName(playerid));
	_MruAdmin(playerid, sprintf("Kupi�e� sobie zmian� nicku za %d MC. Masz teraz %d zmian nicku.", ZMIANA_NICKU_CENA, MRP_GetPlayerNickChanges(playerid)));

	premium_printMcQuantity(playerid);
	DialogMenuDotacje(playerid);
	return 1;
}

KupNumerTelefonu(playerid, string:_numer[])
{
	if(!IsPlayerConnected(playerid)) return 1;
	if(strlen(_numer) < 1) return DialogTelefon(playerid);
	if(strlen(_numer) > 9) return DialogTelefon(playerid);

	new numer = strval(_numer);

	if(!MRP_IsPhoneNumberAvailable(numer))
	{

		new cena;

		if(strlen(_numer) == 1)
			cena = TELEFON_CENA_1;
		else if(strlen(_numer) == 2)
			cena = TELEFON_CENA_2;
		else if(strlen(_numer) == 3)
			cena = TELEFON_CENA_3;
		else if(strlen(_numer) == 4)
			cena = TELEFON_CENA_4;
		else
			cena = TELEFON_CENA_5;

		if(PremiumInfo[playerid][pMC] < cena)
		{
			sendErrorMessage(playerid, "Nie sta� Ci� na ten numer telefonu");
			return DialogTelefon(playerid);
		}

		ZabierzMC(playerid, cena);
		MRP_SetPlayerPhone(playerid, numer);

		_MruAdmin(playerid, sprintf("Tw�j nowy numer telefonu: %d.", numer));
		Log(premiumLog, INFO, "%s kupil numer telefonu %d za %dMC.",
			GetPlayerLogName(playerid), numer, cena);

		premium_printMcQuantity(playerid);
		DialogMenuDotacje(playerid);
	}
	else
	{
		sendErrorMessage(playerid, "Ten numer jest ju� zaj�ty!");
		return DialogTelefon(playerid);
	}

	return 1;
}

//---< Is >---
IsPlayerPremium(playerid)
{
	if(PremiumInfo[playerid][pKP] == 1)
		return 1;
	return 0;
}

IsPlayerPremiumOld(playerid)
{
	if(PremiumInfo[playerid][pKP] == 1)
		return 1;
	if(PlayerInfo[playerid][pDonateRank] != 0)
		return 1;
	return 0;
}
/*
IsAUnikat(modelid)
{
	for(new i; i<MAX_PREMIUM_VEHICLES; i++)
		if(modelid == PojazdyPremium[i][Model])
			return 1;
	return 0;
}*/

PlayerHasSkin(playerid, skinid)
{
	for(new i; i<MAX_PREMIUM_SKINS; i++)
	{
		if(SkinyPremium[i][Model] == skinid)
		{
			return UniqueSkins[playerid][i];
		}
	}
	return false;
}


//------------------<[ MySQL: ]>--------------------
//-----------------<[ Komendy: ]>-------------------

//end