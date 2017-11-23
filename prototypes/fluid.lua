data: extend({
    {
        type = "item-group",
        name = "trench-bombs",
        order = "c",
        icon = "__base__/graphics/item-group/intermediate-products.png",
    },
    {
        type = "item-subgroup",
            name = "trench-bombs-items",
            group = "trench-bombs",
            order = "a"
    },
    {
        type = "fluid",
        name = TB_SHOTCRETE_NAME,
        default_temperature = 25,
        heat_capacity = "1KJ",
        base_color = {
            r = 0.4,
            g = 0.4,
            b = 0.4
        },
        flow_color = {
            r = 0.7,
            g = 0.7,
            b = 0.7
        },
        max_temperature = 100,
        icon = TB_SHOTCRETE_ICON_PATH,
        pressure_to_speed_ratio = 0.1,
        flow_to_energy_ratio = 0.29,
        order = "e[trench_bombs_shotcrete]"
    },

    {
        type = "fluid",
        name = TB_AMMONIA_NAME,
        default_temperature = 25,
        heat_capacity = "0.5KJ",
        base_color = {
            r = 0.8,
            g = 0.8,
            b = 0.8
        },
        flow_color = {
            r = 0.95,
            g = 0.95,
            b = 0.95
        },
        max_temperature = 100,
        icon = TB_AMMONIA_ICON_PATH,
        pressure_to_speed_ratio = 0.5,
        flow_to_energy_ratio = 0.69,
        order = "e[trench_bombs_ammonia]"
    }
})