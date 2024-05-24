-- MRPD Door List

addDoorsListToConfig({
  -- First Floor

    {
        id = "mrpd_PD_Lobby1",
        model = 1079515784,
        coords = vector3(451.09, -991.29, 30.84),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "mrpd_lobby2",
        model = 1079515784,
        coords = vector3(450.01, -990.75, 30.84),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },


    {
        id = "mrpd_briefing",
        double = "mrpd_briefingRight",
        model = 1079515784,
        coords = vector3(440.38, -987.22, 30.84),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "mrpd_PD_lockerroom_women", --done
        model = 1079515784,
        coords = vector3(473.13, -1001.6, 30.84),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },


    {
        id = "mrpd_PD_lockerroom_men", --done
        model = 1079515784,
        coords = vector3(473.13, -1005.7, 30.84),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },


    {
        id = "MRPD_armory", --done
        model = 1079515784,
        coords = vector3(466.8, -1002.9, 30.84),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "mrpd_dispatch", --done
        model = 1079515784,
        coords = vector3(458.95, -990.88, 30.84),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },



})