data: extend({
    {
        type = "recipe",
            name = TB_NAME,
            enabled = true,
            ingredients = {
                {
                    name = TB_SCAFFOLDING_NAME, amount = 1
                },
                {
                    name = TB_PRIMED_ANFO_NAME, amount = 10
                },
                {
                    name = TB_SHOTCRETE_POUCH_NAME, amount = 1
                },
                {
                    name = TB_CHARGE_DETONATOR_NAME, amount = 1
                }
            },
            result = TB_NAME,
            energy_required = 1
    },
    {
        type = "recipe",
        name = TB_DETONATION_COORDINATOR_NAME,
        enabled = true,
        ingredients = {
            { name = "accumulator", amount = 4 },
            { name = "power-switch", amount = 4 },
            { name = "advanced-processing-unit", amount = 10 },
            { name = "copper-cable", amount = 40 },
            { name = "steel-plate", amount = 10 },
            { name = "small-lamp", amount = 3 },
        },
        result = TB_DETONATION_COORDINATOR_NAME,
        energy_required = 20
    },
    {
        type = "recipe",
        name = TB_DETONATOR_NAME,
        enabled = true,
        ingredients = {
            { name = "battery", amount = 2 },
            { name = "plastic-bar", amount = 4 },
            { name = "copper-cable", amount = 4 },
            { name = "aluminium-plate", amount = 2 },
            { name = "advanced-processing-unit", amount = 5 },
        },
        result = TB_DETONATOR_NAME,
        energy_required = 10
    },
    {
        type = "recipe",
        name = TB_SCAFFOLDING_NAME,
        enabled = true,
        ingredients = {
            { name = "steel-plate", amount = 10 }
        },
        result = TB_SCAFFOLDING_NAME,
        energy_required = 0.5
    },
    {
        type = "recipe",
        name = TB_SHOTCRETE_POUCH_NAME,
        enabled = true,
        category = "crafting-with-fluid",
        ingredients = {
            { type = "fluid", name = TB_SHOTCRETE_NAME, amount = 20 },
            { name = "steel-plate", amount = 2 },
            { name = "explosives", amount = 1 },
            { name = "processing-unit", amount = 1 }
        },
        result = TB_SHOTCRETE_POUCH_NAME,
        energy_required = 5
    },
    {
        type = "recipe",
        name = TB_CHARGE_DETONATOR_NAME,
        enabled = true,
        ingredients = {
            { name = "advanced-circuit", amount = 1 },
            { name = "copper-cable", amount = 2 }
        },
        result = TB_CHARGE_DETONATOR_NAME,
        energy_required = 0.5
    },
    {
        type = "recipe",
        name = TB_SHOTCRETE_NAME,
        enabled = true,
        energy_required = 5,
        category = "crafting-with-fluid",
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
        }
    },
    {
        type = "recipe",
        name = TB_PRIMED_ANFO_NAME,
        enabled = true,
        ingredients = {
            { name = TB_ANFO_NAME, amount = 1 },
            { name = TB_SECONDARY_EXPLOSIVE_NAME, amount = 1 },
            { name = "electronic-circuit", amount = 1 },
            { name = "plastic-bar", amount = 1 }
        },
        result = TB_PRIMED_ANFO_NAME,
        energy_required = 2
    },
    {
        type = "recipe",
        name = TB_ANFO_NAME,
        enabled = true,
        category = "chemistry",
        ingredients = {
            { name = TB_AMMONIUM_NITRATE_NAME, amount = 10 },
            { name = TB_POWDERED_ALUMINUM_NAME, amount = 1 },
            { type = "fluid", name = "light-oil", amount = 1 }
        },
        result = TB_ANFO_NAME,
        energy_required = 2
    },
    {
        type = "recipe",
        name = TB_SECONDARY_EXPLOSIVE_NAME,
        enabled = true,
        ingredients = {
            { name = "explosives", amount = 1 },
            { name = TB_BLASTING_CAP_NAME, amount = 1 }
        },
        result = TB_SECONDARY_EXPLOSIVE_NAME,
        energy_required = 1
    },
    {
        type = "recipe",
        name = TB_BLASTING_CAP_NAME,
        enabled = true,
        ingredients = {
            { name = TB_LEAD_AZIDE_NAME, amount = 1 },
            { name = "battery", amount = 1 },
            { name = "electronic-circuit", amount = 1 },
            { name = "plastic-bar", amount = 1 }
        },
        result = TB_BLASTING_CAP_NAME,
        energy_required = 2
    },
    {
        type = "recipe",
        name = TB_POWDERED_ALUMINUM_NAME,
        enabled = true,
        ingredients = {
            { name = "aluminium-plate", amount = 1 }
        },
        results = {{ type = "item", name = TB_POWDERED_ALUMINUM_NAME, amount = 5 }},
        energy_required = 2
    },
    {
        type = "recipe",
        name = TB_LEAD_AZIDE_NAME,
        enabled = true,
        category = "chemistry",
        ingredients = {
            { name = "lead-plate", amount = 1 },
            { type = "fluid", name = "nitrogen", amount = 3 }
        },
        result = TB_LEAD_AZIDE_NAME,
        energy_required = 1
    },
    {
        type = "recipe",
        name = TB_AMMONIA_NAME,
        enabled = true,
        energy_required = 1,
        category = "chemistry",
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