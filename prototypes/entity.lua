data: extend({

    {
        type = "lamp",
            name = TB_NAME,
            icon = "__TrenchBombs__/graphics/trench_bomb.png",
            flags = {
                "not-on-map"
            },
            order = "y",
            max_health = 1,
            dying_explosion = "massive-explosion",
            render_layer = "lower-object",
            collision_box = {
                {
                    -0.35, -0.35
                },
                {
                    0.35,
                    0.35
                }
            },
            selection_box = {
                {
                    -0.5, -0.5
                },
                {
                    0.5,
                    0.5
                }
            },
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input"
            },
            energy_usage_per_tick = "0KW",
            light = {
                intensity = 0.0,
                size = 0
            },
            picture_off = {
                filename = "__TrenchBombs__/graphics/trench_bomb.png",
                x = 0,
                y = 0,
                width = 32,
                height = 32,
                frame_count = 1,
                shift = {
                    0.07,
                    0.07
                }
            },
            picture_on = {
                filename = "__TrenchBombs__/graphics/trench_bomb.png",
                x = 0,
                y = 0,
                width = 32,
                height = 32,
                frame_count = 1,
                shift = {
                    0.07,
                    0.07
                }
            },
            minable = {
                hardness = 0.5,
                mining_time = 0.5,
                result = TB_NAME,
                count = 1
            }
    },

    {
        type = "constant-combinator",
        name = TB_DETONATION_COORDINATOR_NAME,
        icon = TB_DETONATION_COORDINATOR_ENTITY_PATH,
        flags = {
            "placeable-neutral",
            "player-creation"
        },
        minable = {
            hardness = 0.2,
            mining_time = 0.5,
            result = TB_DETONATION_COORDINATOR_NAME
        },
        max_health = 50,
        corpse = "small-remnants",
        dying_explosion = "explosion-hit",

        collision_box = {
            {
                -0.35, -0.35
            },
            {
                0.35,
                0.35
            }
        },
        selection_box = {
            {
                -0.5, -0.5
            },
            {
                0.5,
                0.5
            }
        },

        item_slot_count = 0,

        sprites = {
            north = {
                filename = "__base__/graphics/entity/combinator/combinator-entities.png",
                x = 158,
                y = 126,
                width = 79,
                height = 63,
                frame_count = 1,
                shift = {
                    0.140625,
                    0.140625
                },
            },
            east = {
                filename = "__base__/graphics/entity/combinator/combinator-entities.png",
                y = 126,
                width = 79,
                height = 63,
                frame_count = 1,
                shift = {
                    0.140625,
                    0.140625
                },
            },
            south = {
                filename = "__base__/graphics/entity/combinator/combinator-entities.png",
                x = 237,
                y = 126,
                width = 79,
                height = 63,
                frame_count = 1,
                shift = {
                    0.140625,
                    0.140625
                },
            },
            west = {
                filename = "__base__/graphics/entity/combinator/combinator-entities.png",
                x = 79,
                y = 126,
                width = 79,
                height = 63,
                frame_count = 1,
                shift = {
                    0.140625,
                    0.140625
                },
            }
        },

        activity_led_sprites = {
            north = {
                filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-constant-north.png",
                width = 11,
                height = 10,
                frame_count = 1,
                shift = {
                    0.296875,
                    -0.40625
                },
            },
            east = {
                filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-constant-east.png",
                width = 14,
                height = 12,
                frame_count = 1,
                shift = {
                    0.25,
                    -0.03125
                },
            },
            south = {
                filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-constant-south.png",
                width = 11,
                height = 11,
                frame_count = 1,
                shift = {-0.296875,
                    -0.078125
                },
            },
            west = {
                filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-constant-west.png",
                width = 12,
                height = 12,
                frame_count = 1,
                shift = {-0.21875,
                    -0.46875
                },
            }
        },

        activity_led_light = {
            intensity = 0.8,
            size = 1,
        },

        activity_led_light_offsets = {
            {
                0.296875,
                -0.40625
            },
            {
                0.25,
                -0.03125
            },
            {-0.296875,
                -0.078125
            },
            {-0.21875,
                -0.46875
            }
        },

        circuit_wire_connection_points = {
            {
                shadow = {
                        red = {
                            0.15625,
                            -0.28125
                        },
                        green = {
                            0.65625,
                            -0.25
                        }
                    },
                    wire = {
                        red = {-0.28125,
                            -0.5625
                        },
                        green = {
                            0.21875,
                            -0.5625
                        },
                    }
            },
            {
                shadow = {
                    red = {
                        0.75,
                        -0.15625
                    },
                    green = {
                        0.75,
                        0.25
                    },
                },
                wire = {
                    red = {
                        0.46875,
                        -0.5
                    },
                    green = {
                        0.46875,
                        -0.09375
                    },
                }
            },
            {
                shadow = {
                    red = {
                        0.75,
                        0.5625
                    },
                    green = {
                        0.21875,
                        0.5625
                    }
                },
                wire = {
                    red = {
                        0.28125,
                        0.15625
                    },
                    green = {-0.21875,
                        0.15625
                    }
                }
            },
            {
                shadow = {
                    red = {-0.03125,
                        0.28125
                    },
                    green = {-0.03125,
                        -0.125
                    },
                },
                wire = {
                    red = {-0.46875,
                        0
                    },
                    green = {-0.46875,
                        -0.40625
                    },
                }
            }
        },

        circuit_wire_max_distance = 7.5
    }

})