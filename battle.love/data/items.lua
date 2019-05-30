require 'objects.obj_unit'

-- Adding an equiped item
-- equip types
--	0 - Not an equip item
--  1 - A Head Equip (only one can be equiped)
--  2 - A Body equip (only one can be equiped)
--  3 - Weapon Equip (Only when selected is it used)
--  4 - Misc Equip (Can have as many as needed)
robe =
{
	id = 1,
	equip = 2,
	modifier =
	{
		add = 
		{
			["DEF"] = 1,
		}
	}
}

power_sword = 
{
	id = 2,
	modifier = 
	{
		add = 
		{
			["STR"] = 2,
			["ATK"] = 4
		}
	}
}

spell_slow =
{
	id = 3,
	modifier = 
	{
		mult = 
		{
			["SPD"] = -0.5,
		}
	}	
}