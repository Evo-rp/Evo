-- MRPD Door List

addDoorsListToConfig({
  -- First Floor

    {
        id = "MRPD_FRONTDOOR_1",
        model = 1239973900,
        coords = vector3(434.32455, -980.327, 30.69028),
        locked = false,
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
        id = "MRPD_HOLDINGCELL_ENTRANCE_1",
        model = 1079515784,
        coords = vector3(469.26388, -1004.084, 26.386095),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "MRPD_HOLDINGCELL_ENTRANCE_2",
        model = 1079515784,
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



})