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

})