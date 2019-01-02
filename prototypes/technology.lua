data:extend({
	{
		type = "technology",
		name = TB_NAME,
		icon = TB_ICON_PATH,
        icon_size = 32,
		effects = {
			{
				type = "unlock-recipe",
				recipe = TB_NAME
			}
		},
		unit = {
			count = 1,
			ingredients = {
				{"science-pack-1", 1}
			},
			time = 5
		}
	}
})
