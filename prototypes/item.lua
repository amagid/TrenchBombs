data: extend({
    {
        type = "item",
            name = TB_NAME,
            icon = TB_ICON_PATH,
            flags = {
                "goes-to-quickbar"
            },
            subgroup = "circuit-network",
            place_result = TB_NAME,
            stack_size = 200
    },
    {
        type = "item",
        name = TB_DETONATION_COORDINATOR_NAME,
        icon = TB_DETONATION_COORDINATOR_ICON_PATH,
        flags = {
            "goes-to-quickbar"
        },
        subgroup = "circuit-network",
        place_result = TB_DETONATION_COORDINATOR_NAME,
        stack_size = 10
    },
    {
        type = "capsule",
        name = TB_DETONATOR_NAME,
        icon = TB_DETONATOR_ICON_PATH,
        flags = {
            "goes-to-quickbar"
        },
        subgroup = "capsule",
        capsule_action = {
            type = "use-on-self",
            attack_parameters = {
                type = "projectile",
                ammo_category = "capsule",
                cooldown = 30,
                range = 0,
                ammo_type = {
                    category = "capsule",
                    target_type = "position",
                    action = {
                        type = "direct",
                        action_delivery = {
                            type = "instant",
                            target_effects = {
                                type = "create-entity",
                                entity_name = TB_NAME,
                                trigger_created_entity = true
                            }
                        }
                    }
                }
            }
        },
        stack_size = 10
    },

    {
        type = "item",
        name = TB_SCAFFOLDING_NAME,
        icon = TB_SCAFFOLDING_ICON_PATH,
        flags = {
            "goes-to-quickbar"
        },
        stack_size = 200
    },

    {
        type = "item",
        name = TB_SHOTCRETE_POUCH_NAME,
        icon = TB_SHOTCRETE_POUCH_ICON_PATH,
        flags = {
            "goes-to-quickbar"
        },
        stack_size = 200
    },

    {
        type = "item",
        name = TB_PRIMED_ANFO_NAME,
        icon = TB_PRIMED_ANFO_ICON_PATH,
        flags = {
            "goes-to-quickbar"
        },
        stack_size = 200
    },

    {
        type = "item",
        name = TB_CHARGE_DETONATOR_NAME,
        icon = TB_CHARGE_DETONATOR_ICON_PATH,
        flags = {
            "goes-to-quickbar"
        },
        stack_size = 200
    },

    {
        type = "item",
        name = TB_ANFO_NAME,
        icon = TB_ANFO_ICON_PATH,
        flags = {
            "goes-to-quickbar"
        },
        stack_size = 200
    },

    {
        type = "item",
        name = TB_SECONDARY_EXPLOSIVE_NAME,
        icon = TB_SECONDARY_EXPLOSIVE_ICON_PATH,
        flags = {
            "goes-to-quickbar"
        },
        stack_size = 200
    },

    {
        type = "item",
        name = TB_BLASTING_CAP_NAME,
        icon = TB_BLASTING_CAP_ICON_PATH,
        flags = {
            "goes-to-quickbar"
        },
        stack_size = 200
    },

    {
        type = "item",
        name = TB_AMMONIUM_NITRATE_NAME,
        icon = TB_AMMONIUM_NITRATE_ICON_PATH,
        flags = {
            "goes-to-quickbar"
        },
        stack_size = 200
    },

    {
        type = "item",
        name = TB_POWDERED_ALUMINUM_NAME,
        icon = TB_POWDERED_ALUMINUM_ICON_PATH,
        flags = {
            "goes-to-quickbar"
        },
        stack_size = 200
    },

    {
        type = "item",
        name = TB_LEAD_AZIDE_NAME,
        icon = TB_LEAD_AZIDE_ICON_PATH,
        flags = {
            "goes-to-quickbar"
        },
        stack_size = 200
    }
})