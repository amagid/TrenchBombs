data: extend({

    {
        type = "container",
            name = TB_NAME,
            icon = TB_ENTITY_PATH,
            icon_size = 32,
            flags = {
                "not-on-map"
            },
            operable = false,
            order = "y",
            max_health = 1,
            dying_explosion = "massive-explosion",
            render_layer = "lower-object",
            open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
            close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
            inventory_size = 1,
            picture =
            {
              filename = TB_ENTITY_PATH,
              priority = "extra-high",
              width = 32,
              height = 32,
              shift = {0, 0}
            },
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
            minable = {
                hardness = 0.5,
                mining_time = 0.5,
                result = TB_NAME,
                count = 1
            },
            item_slot_count = 0,

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

            circuit_wire_max_distance = 0
    },

    {
        type = "electric-energy-interface",
        name = TB_DETONATION_COORDINATOR_NAME,
        icon = TB_DETONATION_COORDINATOR_ENTITY_PATH,
        icon_size = 32,
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
        energy_source = {
            type = "electric",
            buffer_capacity = "15MJ",
            usage_priority = "terciary",
            input_flow_limit = "3000kW",
            output_flow_limit = "0kW"
        },
        picture = {
            filename = TB_DETONATION_COORDINATOR_ENTITY_PATH,
            x = 0,
            y = 0,
            width = 32,
            height = 32,
            frame_count = 1,
            shift = {
                0,
                0
            }
        },
        charge_animation = {
            filename = TB_DETONATION_COORDINATOR_ENTITY_PATH,
            x = 0,
            y = 0,
            width = 32,
            height = 32,
            frame_count = 1,
            shift = {
                0,
                0
            }
        },
        charge_cooldown = 30,
        charge_light = {
            intensity = 0.0,
            size = 0,
            color = {
                r = 0.0,
                g = 0.0,
                b = 0.0
            }
        },
        discharge_animation = {
            filename = TB_DETONATION_COORDINATOR_ENTITY_PATH,
            x = 0,
            y = 0,
            width = 32,
            height = 32,
            frame_count = 1,
            shift = {
                0,
                0
            }
        },
        discharge_cooldown = 60,
        discharge_light = {
            intensity = 0.0,
            size = 0,
            color = {
                r = 0.0,
                g = 0.0,
                b = 0.0
            }
        },
        vehicle_impact_sound = {
            filename = "__base__/sound/car-metal-impact.ogg",
            volume = 0.65
        },
        working_sound = {
            sound = {
                filename = "__base__/sound/accumulator-working.ogg",
                volume = 1
            },
            idle_sound = {
                filename = "__base__/sound/accumulator-idle.ogg",
                volume = 0.4
            },
            max_sounds_per_type = 5
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

        circuit_wire_max_distance = 0,
        default_output_signal = {
            type = "virtual",
            name = "signal-A"
        }
    }

})