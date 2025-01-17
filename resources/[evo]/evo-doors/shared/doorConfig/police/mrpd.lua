-- MRPD Door List

addDoorsListToConfig({
  -- First Floor

    {
        id = "MRPD_FRONTDOOR_1",
        model = 1239973900,
        coords = vector3(434.32455, -980.327, 30.69028),
        locked = false,
        double = 'MRPD_FRONTDOOR_2',
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_FRONTDOOR_2",
        model = -1095702117,
        double = 'MRPD_FRONTDOOR_1',
        coords = vector3(434.26705, -981.5385, 30.69028),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_FRONTDOOR_3",
        model = 1239973900,
        double = 'MRPD_FRONTDOOR_4',
        coords = vector3(434.31829, -983.7691, 30.69028),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_FRONTDOOR_4",
        model = -1095702117,
        double = 'MRPD_FRONTDOOR_3',
        coords = vector3(434.31607, -984.8727, 30.69028),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_SIDEDOOR_1",
        model = -1095702117,
        double = 'MRPD_SIDEDOOR_2',
        coords = vector3(441.40325, -999.2327, 30.690294),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_SIDEDOOR_2",
        model = 1239973900,
        double = 'MRPD_SIDEDOOR_1',
        coords = vector3(442.44708, -999.0339, 30.690292),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_SIDEDOOR_3",
        model = 1239973900,
        double = 'MRPD_SIDEDOOR_4',
        coords = vector3(469.16729, -971.6365, 30.68485),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_SIDEDOOR_4",
        model = -1095702117,
        double = 'MRPD_SIDEDOOR_3',
        coords = vector3(468.06539, -971.8006, 30.684848),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_RECORDS_ROOM",
        model = 1079515784,
        coords = vector3(441.52819, -977.2322, 30.689283),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_OFFICE_HALL",
        model = 1079515784,
        coords = vector3(449.93069, -977.2735, 30.689277),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_MAIN_LOBBY_DOOR",
        model = 1079515784,
        coords = vector3(449.23205, -990.2468, 30.689277),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_BRIEFING_ROOM_1",
        model = 1079515784,
        coords = vector3(440.89364, -989.2229, 30.689268),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_BRIEFING_ROOM_2",
        model = 1079515784,
        coords = vector3(439.87, -987.80, 30.68),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_BRIEFING_ROOM_EMERGENCY_EXIT",
        model = 794198680,
        coords = vector3(426.44448, -998.2934, 30.689268),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },


    {
        id = "MRPD_HOLDINGCELL_ENTRANCE_1",
        model = 1079515784,
        coords = vector3(469.26388, -1004.084, 26.386095),
        double = 'MRPD_HOLDINGCELL_ENTRANCE_2',
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HOLDINGCELL_ENTRANCE_2",
        model = 1079515784,
        double = 'MRPD_HOLDINGCELL_ENTRANCE_1',
        coords = vector3(468.11157, -1004.196, 26.386095),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HOLDINGCELL_EMERGENCY_EXIT_1",
        model = -158854912,
        coords = vector3(469.29867, -1014.142, 26.386085),
        double = 'MRPD_HOLDINGCELL_EMERGENCY_EXIT_2',
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HOLDINGCELL_EMERGENCY_EXIT_2",
        model = 794198680,
        coords = vector3(468.19436, -1014.138, 26.386085),
        double = 'MRPD_HOLDINGCELL_EMERGENCY_EXIT_1',
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_OBSERVATION_ROOM",
        model = 1079515784,
        coords = vector3(473.33151, -1008.124, 26.386093),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_OBSERVATION_ROOM_2",
        model = 1079515784,
        coords = vector3(486.35018, -1008.119, 26.386087),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_INTERROGATION_ROOM",
        model = 1079515784,
        coords = vector3(477.35824, -1008.241, 26.386091),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_INTERROGATION_OBSERVATION_DIVIDER_DOOR",
        model = 1079515784,
        coords = vector3(485.14724, -1015.372, 26.386098),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_INTERROGATION_ROOM_2",
        model = 1079515784,
        coords = vector3(482.34588, -1008.12, 26.386087),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_INTERROGATION_OBSERVATION_DIVIDER_DOOR_2",
        model = 1079515784,
        coords = vector3(474.68557, -1015.603, 26.386098),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_CELLS_1",
        model = -113421396,
        coords = vector3(480.0213, -1004.918, 26.386049),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_CELLS_2",
        model = -113421396,
        coords = vector3(480.00427, -1000.858, 26.386045),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_MUGSHOT_ROOM",
        model = 1079515784,
        coords = vector3(477.96197, -1001.586, 26.386093),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_LINEUP_ROOM",
        model = 1079515784,
        coords = vector3(478.66043, -998.3922, 26.386074),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HOLDING_CELL_1",
        model = -691335480,
        coords = vector3(486.53027, -987.0224, 26.386079),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HOLDING_CELL_2",
        model = -300093563,
        coords = vector3(483.99182, -997.5967, 26.386072),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HOLDING_CELL_3",
        model = 11515395,
        coords = vector3(483.93139, -1003.619, 26.386081),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HOLDING_CELL_4",
        model = -300093563,
        coords = vector3(478.07772, -989.3062, 26.386096),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HOLDING_CELL_5",
        model = 11515395,
        coords = vector3(471.91491, -989.4775, 26.386096),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HOLDING_CELL_6",
        model = -300093563,
        coords = vector3(472.06124, -987.3369, 26.386095),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HOLDING_CELL_7",
        model = 11515395,
        coords = vector3(478.21618, -987.2774, 26.386093),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_DOOR_CELL",
        model = -113421396,
        coords = vector3(482.9898, -996.3041, 26.386068),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_DOOR_CELL2",
        model = -113421396,
        coords = vector3(479.23971, -988.323, 26.385997),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_ARMORY_DOOR",
        model = 1079515784,
        coords = vector3(467.21887, -1002.143, 30.689264),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },


    {
        id = "MRPD_STAIRS_1",
        model = 1079515784,
        coords = vector3(470.9779, -978.1656, 30.689281),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_STAIRS_2",
        model = 1079515784,
        coords = vector3(467.02767, -1005.176, 30.689281),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_UPSTAIRS_2",
        model = 1079515784,
        coords = vector3(467.09481, -1004.954, 40.207386),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_UPSTAIRS_1",
        model = 1079515784,
        coords = vector3(471.10748, -978.1715, 40.207378),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_EVIDENCE_ROOM_DOOR",
        model = 1079515784,
        coords = vector3(474.65753, -986.2953, 30.689277),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },


    {
        id = "MRPD_DISPATCH_ROOM",
        model = 1079515784,
        coords = vector3(458.14981, -991.1163, 30.689279),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_BRIEFING_ROOM_ENTRANCE_2",
        model = 1079515784,
        coords = vector3(439.57052, -996.8442, 30.689281),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_MAIN_HALLWAY_DOOR",
        model = 1079515784,
        coords = vector3(450.58279, -991.9012, 30.689277),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_MAIN_HALLWAY_DOOR_2",
        model = 1079515784,
        coords = vector3(465.79605, -991.9835, 30.68927),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HELIPAD_STAIRS",
        model = 1079515784,
        coords = vector3(470.86752, -986.0703, 40.207427),
        double = 'MRPD_HELIPAD_STAIRS_2',
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HELIPAD_STAIRS_2",
        model = 1079515784,
        double = 'MRPD_HELIPAD_STAIRS',
        coords = vector3(470.83529, -987.7415, 40.207427),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HELIPAD_DOOR",
        model = -158854912,
        coords = vector3(469.00085, -990.186, 45.239124),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HELIPAD_DOOR_2",
        model = 794198680,
        coords = vector3(468.94256, -983.6218, 45.230537),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_DOOR_HALLWAY",
        model = 1079515784,
        coords = vector3(465.80899, -977.4143, 30.689264),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_DOOR_RECEPTION",
        model = 1079515784,
        coords = vector3(452.34463, -978.2862, 30.689268),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },


    {
        id = "MRPD_GARAGE_DOOR_1",
        model = 1079515784,
        double = 'MRPD_GARAGE_DOOR_2',
        coords = vector3(457.14791, -992.353, 26.381092),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },


    {
        id = "MRPD_GARAGE_DOOR_2",
        model = 1079515784,
        double = 'MRPD_GARAGE_DOOR_1',
        coords = vector3(457.09582, -993.7227, 26.381092),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_GARAGE_DOOR_3",
        model = 1079515784,
        double = 'MRPD_GARAGE_DOOR_4',
        coords = vector3(457.08694, -980.2319, 26.381078),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_GARAGE_DOOR_4",
        model = 1079515784,
        double = 'MRPD_GARAGE_DOOR_3',
        coords = vector3(457.09786, -981.6198, 26.381078),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_SECURITY_ROOM",
        model = 1079515784,
        coords = vector3(460.7308, -982.2282, 26.386089),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_SECURITY_ROOM_2",
        model = 1079515784,
        coords = vector3(460.9139, -991.5652, 26.386096),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },


    
    {
        id = "MRPD_BASEMENT_STAIRS",
        model = 1079515784,
        coords = vector3(470.78198, -978.4297, 26.386095),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },


    {
        id = "MRPD_CELLS_VISTATION_DOOR",
        model = 1079515784,
        coords = vector3(478.49212, -981.1352, 26.386075),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_CELLS_VISTATION_DOOR_2",
        model = 1079515784,
        coords = vector3(480.47616, -987.2059, 26.386096),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_LINEUP_OFFICE",
        model = 1079515784,
        coords = vector3(470.73339, -995.2382, 26.386093),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_MORE_BASEMENT_STAIRS",
        model = 1079515784,
        coords = vector3(467.28762, -1002.464, 26.386095),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_BASEMENT_HOLDING_DOOR",
        model = 1079515784,
        coords = vector3(471.75054, -1005.95, 26.386091),
        double = 'MRPD_BASEMENT_HOLDING_DOOR_2',
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_BASEMENT_HOLDING_DOOR_2",
        model = 1079515784,
        double = 'MRPD_BASEMENT_HOLDING_DOOR',
        coords = vector3(471.75701, -1007.38, 26.386087),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },
















































    ----- GOT TO SET UP POLYZONES FOR THIS SHIT I DONT FEEL LIKE DOING ALLAT
    {
        id = "MRPD_GATE_1",
        model = -246583363,
        coords = vector3(451.18801, -1000.755, 25.765163),
        locked = true,
        special = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_GATE_2",
        model = -246583363,
        coords = vector3(432.60177, -1000.678, 25.773921),
        locked = true,
        special = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

})