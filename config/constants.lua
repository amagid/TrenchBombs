DEBUG = true

TB_NAME = "trench_bombs"
TB_PRETTY_NAME = "Trench Bombs"

TB_ICON_PATH = "__TrenchBombs__/graphics/trench_bombs_icon.png"
TB_ENTITY_PATH = "__TrenchBombs__/graphics/trench_bombs_entities.png"

TB_DETONATOR_NAME = "trench_bombs_detonator"
TB_DETONATOR_PRETTY_NAME = "Trench Bomb Detonator"

TB_DETONATOR_ICON_PATH = "__TrenchBombs__/graphics/trench_bombs_detonator_icon.png"
TB_DETONATOR_ENTITY_PATH = "__TrenchBombs__/graphics/trench_bombs_detonator_entities.png"

TB_DETONATION_COORDINATOR_NAME = "trench_bombs_detonation_coordinator"
TB_DETONATION_COORDINATOR_PRETTY_NAME = "Trench Bomb Detonation Coordinator"

TB_DETONATION_COORDINATOR_ICON_PATH = "__TrenchBombs__/graphics/trench_bombs_detonation_coordinator_icon.png"
TB_DETONATION_COORDINATOR_ENTITY_PATH = "__TrenchBombs__/graphics/trench_bombs_detonation_coordinator_entities.png"

TB_DETONATION_COMMAND = "trench_bombs_detonation_command"
TB_DETONATION_SIGNAL = "trench_bombs_detonation_signal"

TB_EXPLOSION_NAME = "trench_bombs_explosion"

TB_DEFAULT_PRIVATE_DATA = {
    dcs = {},
    detonation = {
        currentStage = {},
        nextStage = {},
        surface = {}
    }
}

TB_DEFAULT_PUBLIC_DATA = {
    counter = 0,
    detonationsInProgress = {}
}

TB_DETONATION_DELAY = 10

TB_DETONATION_EVENT = "trench_bombs_detonation_event"