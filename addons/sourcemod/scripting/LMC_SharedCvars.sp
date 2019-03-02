#pragma semicolon 1
#include <sourcemod>
#pragma newdecls required

#define PLUGIN_VERSION "1.0"

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
	EngineVersion iEngineVersion = GetEngineVersion();
	if(iEngineVersion != Engine_Left4Dead2 && iEngineVersion != Engine_Left4Dead)
	{
		strcopy(error, err_max, "Plugin only supports Left 4 Dead 1/2");
		return APLRes_SilentFailure;
	}	
	return APLRes_Success;
}

public Plugin myinfo =
{
	name = "LMCSharedCvars",
	author = "Lux",
	description = "Modules that sharecvars are put in here",
	version = PLUGIN_VERSION,
	url = "https://forums.alliedmods.net/showthread.php?p=2607394"
};

public void OnPluginStart()
{
	CreateConVar("lmc_sharedcvars_version", PLUGIN_VERSION, "LMC_SharedCvars_Version", FCVAR_DONTRECORD|FCVAR_NOTIFY);
	
	CreateConVar("lmc_allowtank", "0", "Allow Tanks to have custom model? (1 = true)",FCVAR_NOTIFY, true, 0.0, true, 1.0);
	CreateConVar("lmc_allowhunter", "1", "Allow Hunters to have custom model? (1 = true)", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	CreateConVar("lmc_allowsmoker", "1", "Allow Smoker to have custom model? (1 = true)",FCVAR_NOTIFY, true, 0.0, true, 1.0);
	CreateConVar("lmc_allowboomer", "1", "Allow Boomer to have custom model? (1 = true)", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	CreateConVar("lmc_allowSurvivors", "1", "Allow Survivors to have custom model? (1 = true)", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	CreateConVar("lmc_allow_tank_model_use", "0", "The tank model is big and don't look good on other models so i made it optional(1 = true)", FCVAR_NOTIFY, true, 0.0, true, 1.0);
	CreateConVar("lmc_precache_prevent", "", "Disables model precaching on selected maps to prevent crashing, e.g. \"c1m3_mall,c11m1_greenhouse,\" for dead center map 3 and dead air map 1", FCVAR_NOTIFY);
	
	AutoExecConfig(true, "LMC_SharedCvars");
}