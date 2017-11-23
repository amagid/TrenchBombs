data: extend({
    {
        type = "recipe",
            name = TB_NAME,
            enabled = true,
            ingredients = {},
            result = TB_NAME,
            energy_required = 0.1
    },
    {
        type = "recipe",
        name = TB_DETONATION_COORDINATOR_NAME,
        enabled = true,
        ingredients = {},
        result = TB_DETONATION_COORDINATOR_NAME,
        energy_required = 0.1
    },
    {
        type = "recipe",
        name = TB_DETONATOR_NAME,
        enabled = true,
        ingredients = {},
        result = TB_DETONATOR_NAME,
        energy_required = 0.1
    },
    {
        type = "recipe",
        name = TB_SHOTCRETE_NAME,
        enabled = true,
        energy_required = 5,
        ingredients = {
            {
                type = "fluid", name = "water", amount = 100
            },
            {
                name = "concrete",
                amount = 10
            }
        },
        results = {
            {
                type = "fluid", name = TB_SHOTCRETE_NAME, amount = 10
            }
        },
        subgroup = "fluid-recipes"
    },
    {
        type = "recipe",
        name = TB_AMMONIA_NAME,
        enabled = true,
        energy_required = 1,
        ingredients = {
            {
                type = "fluid", name = "hydrogen", amount = 30
            },
            {
                type = "fluid", name = "nitrogen", amount = 10
            },
            {
                name = "iron-plate", amount = 1
            }
        },
        results = {
            {
                type = "fluid", name = TB_AMMONIA_NAME, amount = 20
            }
        },
        subgroup = "fluid-recipes"
    }
})