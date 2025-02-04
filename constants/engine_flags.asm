; EngineFlags indexes (see data/events/engine_flags.asm)
	const_def
; wPokegearFlags
	const ENGINE_RADIO_CARD
	const ENGINE_MAP_CARD
	const ENGINE_PHONE_CARD
	const ENGINE_EXPN_CARD
	const ENGINE_POKEGEAR
; wDayCareMan
	const ENGINE_DAY_CARE_MAN_HAS_EGG
	const ENGINE_DAY_CARE_MAN_HAS_MON
; wDayCareLady
	const ENGINE_DAY_CARE_LADY_HAS_MON
; wMomSavingMoney
	const ENGINE_MOM_SAVING_MONEY
	const ENGINE_MOM_ACTIVE
; wUnusedTwoDayTimerOn
	const ENGINE_UNUSED_TWO_DAY_TIMER_ON
; wStatusFlags
	const ENGINE_POKEDEX
	const ENGINE_UNOWN_DEX
	const ENGINE_CAUGHT_POKERUS
	const ENGINE_ROCKET_SIGNAL_ON_CH20
	const ENGINE_CREDITS_SKIP
; wStatusFlags2
	const ENGINE_BUG_CONTEST_TIMER
	const ENGINE_SAFARI_ZONE
	const ENGINE_ROCKETS_IN_RADIO_TOWER
	const ENGINE_BIKE_SHOP_CALL_ENABLED
	const ENGINE_14
	const ENGINE_REACHED_GOLDENROD
	const ENGINE_ROCKETS_IN_MAHOGANY
; wBikeFlags
	const ENGINE_STRENGTH_ACTIVE
	const ENGINE_ALWAYS_ON_BIKE
	const ENGINE_DOWNHILL
; wJohtoBadges
	const ENGINE_ZEPHYRBADGE
	const ENGINE_HIVEBADGE
	const ENGINE_PLAINBADGE
	const ENGINE_FOGBADGE
	const ENGINE_MINERALBADGE
	const ENGINE_STORMBADGE
	const ENGINE_GLACIERBADGE
	const ENGINE_RISINGBADGE
; wKantoBadges
	const ENGINE_BOULDERBADGE
	const ENGINE_CASCADEBADGE
	const ENGINE_THUNDERBADGE
	const ENGINE_RAINBOWBADGE
	const ENGINE_SOULBADGE
	const ENGINE_MARSHBADGE
	const ENGINE_VOLCANOBADGE
	const ENGINE_EARTHBADGE
; wUnlockedUnowns
	const ENGINE_UNLOCKED_UNOWNS_A_TO_K
	const ENGINE_UNLOCKED_UNOWNS_L_TO_R
	const ENGINE_UNLOCKED_UNOWNS_S_TO_W
	const ENGINE_UNLOCKED_UNOWNS_X_TO_Z
	const ENGINE_UNLOCKED_UNOWNS_UNUSED_4
	const ENGINE_UNLOCKED_UNOWNS_UNUSED_5
	const ENGINE_UNLOCKED_UNOWNS_UNUSED_6
	const ENGINE_UNLOCKED_UNOWNS_UNUSED_7
; wVisitedSpawns
	const ENGINE_FLYPOINT_PLAYERS_HOUSE
	const ENGINE_FLYPOINT_DEBUG
	const ENGINE_FLYPOINT_PALLET
	const ENGINE_FLYPOINT_VIRIDIAN
	const ENGINE_FLYPOINT_PEWTER
	const ENGINE_FLYPOINT_CERULEAN
	const ENGINE_FLYPOINT_ROCK_TUNNEL
	const ENGINE_FLYPOINT_VERMILION
	const ENGINE_FLYPOINT_LAVENDER
	const ENGINE_FLYPOINT_SAFFRON
	const ENGINE_FLYPOINT_CELADON
	const ENGINE_FLYPOINT_FUCHSIA
	const ENGINE_FLYPOINT_CINNABAR
	const ENGINE_FLYPOINT_INDIGO_PLATEAU
	const ENGINE_FLYPOINT_NEW_BARK
	const ENGINE_FLYPOINT_CHERRYGROVE
	const ENGINE_FLYPOINT_VIOLET
	const ENGINE_FLYPOINT_AZALEA
	const ENGINE_FLYPOINT_CIANWOOD
	const ENGINE_FLYPOINT_GOLDENROD
	const ENGINE_FLYPOINT_OLIVINE
	const ENGINE_FLYPOINT_ECRUTEAK
	const ENGINE_FLYPOINT_MAHOGANY
	const ENGINE_FLYPOINT_LAKE_OF_RAGE
	const ENGINE_FLYPOINT_BLACKTHORN
	const ENGINE_FLYPOINT_SILVER_CAVE
	const ENGINE_FLYPOINT_UNUSED
; wLuckyNumberShowFlag
	const ENGINE_LUCKY_NUMBER_SHOW
; wStatusFlags2
	const ENGINE_4E
; wDailyFlags1
	const ENGINE_KURT_MAKING_BALLS
	const ENGINE_DAILY_BUG_CONTEST
	const ENGINE_SWARM
	const ENGINE_TIME_CAPSULE
	const ENGINE_ALL_FRUIT_TREES
	const ENGINE_GOT_SHUCKIE_TODAY
	const ENGINE_GOLDENROD_UNDERGROUND_MERCHANT_CLOSED
	const ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
; wDailyFlags2
	const ENGINE_MT_MOON_SQUARE_CLEFAIRY
	const ENGINE_UNION_CAVE_LAPRAS
	const ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	const ENGINE_GOLDENROD_DEPT_STORE_TM27_RETURN
	const ENGINE_DAISYS_GROOMING
	const ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
; wPlayerGender
	const ENGINE_PLAYER_IS_FEMALE
DEF NUM_ENGINE_FLAGS EQU const_value
