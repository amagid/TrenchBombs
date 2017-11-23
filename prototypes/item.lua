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
            type = "throw",
            attack_parameters = {
                type = "projectile",
                ammo_category = "capsule",
                cooldown = 15,
                projectile_creation_distance = 0.6,
                range = 20,
                ammo_type = {
                    category = "capsule",
                    target_type = "position",
                    action = {
                        type = "direct",
                        action_delivery = {
                            type = "projectile",
                            projectile = TB_DETONATION_SIGNAL,
                            starting_speed = 0.3
                        }
                    }
                }
            }
        },
        stack_size = 10
    },
    {
        type = "projectile",
        name = TB_DETONATION_SIGNAL,
        flags = {
            "not-on-map"
        },
        acceleration = 0.005,
        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "create-entity",
                            show_in_tooltip = false,
                            entity_name = TB_DETONATION_COMMAND,
                            trigger_created_entity = true
                    },
                }
            }
        },
        light = {
            intensity = 0.0,
            size = 0
        },
        enable_drawing_with_mask = false,
        animation = {
            layers = {
                {
                    filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule.png",
                        flags = {
                            "no-crop"
                        },
                        frame_count = 1,
                        width = 1,
                        height = 1,
                        priority = "low"
                },
                {
                    filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule-mask.png",
                    flags = {
                        "no-crop"
                    },
                    frame_count = 1,
                    width = 1,
                    height = 1,
                    priority = "low",
                    apply_runtime_tint = true,
                },
            },
        },
        shadow = {
            filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule-shadow.png",
            flags = {
                "no-crop"
            },
            frame_count = 1,
            width = 1,
            height = 1,
            priority = "low"
        },
        smoke = {
            {
                name = "smoke-fast",
                    deviation = {
                        0,
                        0
                    },
                    frequency = 0,
                    position = {
                        0,
                        0
                    },
                    starting_frame = 3,
                    starting_frame_deviation = 5,
                    starting_frame_speed_deviation = 5
            }
        },
    },
    {
        type = "combat-robot",
        name = TB_DETONATION_COMMAND,
        icon = "__base__/graphics/icons/defender.png",
        flags = {
            "placeable-player",
            "player-creation",
            "placeable-off-grid",
            "not-on-map",
            "not-repairable"
        },
        resistances = {
            {
                type = "fire", percent = 95
            }
        },
        subgroup = "capsule",
        order = "e-a-a",
        max_health = 60,
        alert_when_damaged = false,
        collision_box = {
            {
                0,
                0
            },
            {
                0,
                0
            }
        },
        selection_box = {
            {
                -0.5, -1.5
            },
            {
                0.5,
                -0.5
            }
        },
        distance_per_frame = 0.13,
        time_to_live = 60 * 45,
        follows_player = true,
        friction = 0.01,
        range_from_player = 6.0,
        speed = 0.01,
        destroy_action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                source_effects = {
                    type = "create-entity",
                    entity_name = "explosion"
                }
            }
        },
        attack_parameters = {
            type = "projectile",
            ammo_category = "bullet",
            cooldown = 20,
            projectile_center = {
                0,
                1
            },
            projectile_creation_distance = 0.6,
            range = 15,
            sound = make_light_gunshot_sounds(),
            ammo_type = {
                category = "bullet",
                action = {
                    type = "direct",
                    action_delivery = {
                        type = "instant",
                        source_effects = {
                            type = "create-explosion",
                            entity_name = "explosion-gunshot-small"
                        },
                        target_effects = {
                            {
                                type = "create-entity",
                                    entity_name = "explosion-hit"
                            },
                            {
                                type = "damage",
                                damage = {
                                    amount = 5,
                                    type = "physical"
                                }
                            }
                        }
                    }
                }
            }
        },
        idle = {
            layers = {
                {
                    filename = "__base__/graphics/entity/defender-robot/defender-robot.png",
                        priority = "high",
                        line_length = 16,
                        width = 1,
                        height = 1,
                        frame_count = 1,
                        direction_count = 16,
                        shift = {
                            0,
                            0.015625
                        }
                },
                {
                    filename = "__base__/graphics/entity/defender-robot/defender-robot-mask.png",
                    priority = "high",
                    line_length = 16,
                    width = 18,
                    height = 16,
                    frame_count = 1,
                    direction_count = 16,
                    shift = {
                        0,
                        -0.125
                    },
                    apply_runtime_tint = true
                },
            }
        },
        shadow_idle = {
            filename = "__base__/graphics/entity/defender-robot/defender-robot-shadow.png",
            priority = "high",
            line_length = 16,
            width = 43,
            height = 23,
            frame_count = 1,
            direction_count = 16,
            shift = {
                0.859375,
                0.609375
            }
        },
        in_motion = {
            layers = {
                {
                    filename = "__base__/graphics/entity/defender-robot/defender-robot.png",
                        priority = "high",
                        line_length = 16,
                        width = 1,
                        height = 1,
                        frame_count = 1,
                        direction_count = 16,
                        shift = {
                            0,
                            0.015625
                        },
                        y = 33
                },
                {
                    filename = "__base__/graphics/entity/defender-robot/defender-robot-mask.png",
                    priority = "high",
                    line_length = 16,
                    width = 18,
                    height = 16,
                    frame_count = 1,
                    direction_count = 16,
                    shift = {
                        0,
                        -0.125
                    },
                    apply_runtime_tint = true,
                    y = 16
                },
            }
        },
        shadow_in_motion = {
            filename = "__base__/graphics/entity/defender-robot/defender-robot-shadow.png",
            priority = "high",
            line_length = 16,
            width = 43,
            height = 23,
            frame_count = 1,
            direction_count = 16,
            shift = {
                0.859375,
                0.609375
            }
        }
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