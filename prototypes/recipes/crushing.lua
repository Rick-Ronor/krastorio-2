-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "crushing"
return
{
	{
		type = "recipe",
		name = "sand",
		category = "crushing",
		hide_from_player_crafting = false,
		always_show_made_in = true,
		allow_as_intermediate = false,
		allow_intermediates = false,
		always_show_products = true,
		energy_required = 1,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"stone", 2}
		},
		result = "sand",
		result_count = 6
	},
	{
		type = "recipe",
		name = "imersite-powder",
		category = "crushing",
		icon = kr_items_with_variations_icons_path .. "imersite-powder/imersite-powder.png",
		icon_size = 64,
		hide_from_player_crafting = false,
		always_show_made_in = true,
		allow_as_intermediate = false,
		allow_intermediates = false,
		always_show_products = true,
		energy_required = 3,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"raw-imersite", 3}
		},
		results =
		{
			{"imersite-powder", 3},
			{"sand", 6}
		},
		main_product = "imersite-powder"
	}
}