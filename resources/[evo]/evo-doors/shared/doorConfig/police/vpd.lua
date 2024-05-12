-- vinewood PD / lspdm

addDoorsListToConfig({


    -- Basement
    {
        id = "vinewood_PD_basementstairs",
        model = 904042749,
        coords = vector3(607.02, -3.43, 75.47),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_interrogation1",
        model = 1209875826,
        coords = vector3(620.82, -9.15, 75.19),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_interrogation1back",
        model = 1209875826,
        coords = vector3(623.31, -10.05, 75.19),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_interrogation2back",
        model = 1209875826,
        coords = vector3(624.67, -10.55, 75.19),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_interrogation2",
        model = 1209875826,
        coords = vector3(627.16, -11.46, 75.19),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_cellsouthentranceleft",
        double = "vinewood_PD_cellsouthright",
        model = 1209875826,
        coords = vector3(624.51, -5.11, 75.2),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_cellsouthright",
        double = "vinewood_PD_cellsouthentranceleft",
        model = 1209875826,
        coords = vector3(626.93, -5.99, 75.2),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_cellwestentranceleft",
        double = "vinewood_PD_cellwestentranceright",
        model = 904042749,
        coords = vector3(621.02, 4.0, 75.2),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_cellwestentranceright",
        double = "vinewood_PD_cellwestentranceleft",
        model = 904042749,
        coords = vector3(620.15, 1.59, 75.2),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_cell1",
        model = -1211457738,
        coords = vector3(625.36, 3.55, 75.21),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_cell2",
        model = -1211457738,
        coords = vector3(629.57, 2.01, 75.21),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_cell3",
        model = -1211457738,
        coords = vector3(633.79, 0.48, 75.21),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_cell4",
        model = -1211457738,
        coords = vector3(638.01, -1.06, 75.21),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_cell5",
        model = -1211457738,
        coords = vector3(630.96, -3.45, 75.21),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_cell6",
        model = -1211457738,
        coords = vector3(623.76, -0.83, 75.21),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_idroom",
        model = 1209875826,
        coords = vector3(620.03, 8.28, 75.19),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_mugshotroom",
        model = 904042749,
        coords = vector3(615.78, 7.34, 75.19),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_bookyeast",
        model = 1209875826,
        coords = vector3(615.13, 5.54, 75.19),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_evidenceroombasement",
        model = 1209875826,
        coords = vector3(608.58, 3.85, 75.19),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_gatebeforegarage",
        model = -1211457738,
        coords = vector3(608.19, -0.27, 75.21),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_doortogarageleft",
        double = "vinewood_PD_doortogarageright",
        model = 350684880,
        coords = vector3(602.09, 1.55, 75.17),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_doortogarageright",
        double = "vinewood_PD_doortogarageleft",
        model = 350684880,
        coords = vector3(602.8, 3.5, 75.17),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_garageleft",
        model = -937317868,
        coords = vector3(527.19, -24.41, 71.43),
        locked = true,
        special = true,
        --holdOpen = true,
        --autoRate = 6.0,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 70, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_garageright",
        model = -937317868,
        coords = vector3(531.77, -21.61, 71.43),
        locked = true,
        special = true,
        --holdOpen = true,
        --autoRate = 6.0,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 20, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 70, jobPermission = false, reqDuty = true },
        },
    },

    -- first floor
    {
        id = "vinewood_PD_frontdooreastright",
        double = "vinewood_PD_frontdooreastleft",
        model = -1741081375,
        coords = vector3(638.17, 3.29, 82.96),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_frontdooreastleft",
        double = "vinewood_PD_frontdooreastright",
        model = -1741081375,
        coords = vector3(637.24, 0.74, 82.96),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },
 
    {
        id = "vinewood_PD_firstfloorstairs",
        model = 904042749,
        coords = vector3(607.06, -3.45, 83.79),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_firstflooroffice",
        model = -78496913,
        coords = vector3(621.51, -6.48, 83.79),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 50, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_firstfloorstaffonly",
        model = 904042749,
        coords = vector3(617.68, -3.05, 83.79),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_firstfloorarchive",
        model = 904042749,
        coords = vector3(613.43, 0.89, 83.79),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_behindfrontdesk1",
        double = "vinewood_PD_behindfrontdesk2",
        model = 904042749,
        coords = vector3(618.18, 2.97, 83.79),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_behindfrontdesk2",
        double = "vinewood_PD_behindfrontdesk1",
        model = 1302435108,
        coords = vector3(604.53, 7.71, 75.03),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_pressroomright",
        double = "vinewood_PD_pressroomleft",
        model = -949097449,
        coords = vector3(632.46, -4.12, 82.91),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_pressroomleft",
        double = "vinewood_PD_pressroomright",
        model = -949097449,
        coords = vector3(630.84, -3.52, 82.91),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },

-- 2nd Floor 

    {
        id = "vinewood_PD_northentrance1",
        double = "vinewood_PD_northentrance2",
        model = -1741081375,
        coords = vector3(620.95, 16.2, 88.02),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_northentrance2",
        double = "vinewood_PD_northentrance1",
        model = -1741081375,
        coords = vector3(618.4, 17.13, 88.02),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_informationdesk",
        model = 904042749,
        coords = vector3(621.29, 11.25, 87.95),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_lobby1",
        double = "vinewood_PD_lobby2",
        model = 904042749,
        coords = vector3(622.52, -0.5, 83.79),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_lobby2",
        double = "vinewood_PD_lobby1",
        model = 904042749,
        coords = vector3(620.1, 0.38, 83.79),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },


    {
        id = "vinewood_PD_lockerroom",
        model = 1209875826,
        coords = vector3(614.07, 10.46, 87.95),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_showers",
        model = 1209875826,
        coords = vector3(604.58, 13.92, 87.95),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_armory",
        model = 904042749,
        coords = vector3(611.72, 4.02, 87.95),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_2ndfloorstairs",
        model = 904042749,
        coords = vector3(607.06, -3.45, 87.95),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_2ndfloorhallway1",
        double = "vinewood_PD_2ndfloorhallway2",
        model = 350684880,
        coords = vector3(618.54, -2.8, 87.93),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_2ndfloorhallway2",
        double = "vinewood_PD_2ndfloorhallway1",
        model = 350684880,
        coords = vector3(619.25, -0.84, 87.93),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_captainleft",
        double = "vinewood_PD_captainright",
        model = -949097449,
        coords = vector3(628.39, -6.05, 87.97),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 80, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_captainright",
        double = "vinewood_PD_captainleft",
        model = -949097449,
        coords = vector3(627.8, -7.67, 87.97),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 80, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_briefingleft",
        double = "vinewood_PD_briefingright",
        model = -949097449,
        coords = vector3(626.03, -12.53, 87.97),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_briefingright",
        double = "vinewood_PD_briefingleft",
        model = 873012818,
        coords = vector3(627.02, -16.42, 87.35),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_breakroomleft",
        double = "vinewood_PD_breakroomright",
        model = -949097449,
        coords = vector3(617.99, -20.02, 87.97),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_breakroomright",
        double = "vinewood_PD_breakroomleft",
        model = -949097449,
        coords = vector3(618.58, -18.39, 87.97),
        locked = false,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_detectiveleft",
        double = "vinewood_PD_detectiveright",
        model = -949097449,
        coords = vector3(621.96, -23.7, 87.97),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 50, jobPermission = false, reqDuty = false },
        },
    },

    {
        id = "vinewood_PD_detectiveright",
        double = "vinewood_PD_detectiveleft",
        model = -949097449,
        coords = vector3(621.37, -25.33, 87.97),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 50, jobPermission = false, reqDuty = false },
        },
    },

    -- Rooftop

    {
        id = "vinewood_PD_rooftopdoor",
        model = -622054112,
        coords = vector3(606.23, -12.09, 101.49),
        locked = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    -- Elevators

    {
        id = "vinewood_PD_1leftelevator1",
        double = "vinewood_PD_1leftelevator2",
        model = -1240156945,
        coords = vector3(614.32, -9.41, 82.63),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_1leftelevator2",
        double = "vinewood_PD_1leftelevator1",
        model = -1240156945,
        coords = vector3(612.91, -8.89, 82.63),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_1rightelevator1",
        double = "vinewood_PD_1rightelevator2",       
        model = -1240156945,
        coords = vector3(609.75, -7.75, 82.63),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_1rightelevator2",  
        double = "vinewood_PD_1rightelevator1",        
        model = -1240156945,
        coords = vector3(608.34, -7.23, 82.63),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_basementleftelevator1",
        double = "vinewood_PD_basementleftelevator2",
        model = -1240156945,
        coords = vector3(608.34, -7.23, 73.98),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_basementleftelevator2",
        double = "vinewood_PD_basementleftelevator1",
        autoRate = 6.0,
        model = -1240156945,
        coords = vector3(609.76, -7.75, 73.98),
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_basementleftelevator3",
        double = "vinewood_PD_basementleftelevator4",
        autoRate = 6.0,
        model = -1240156945,
        coords = vector3(612.91, -8.89, 73.98),
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_basementleftelevator4",
        double = "vinewood_PD_basementleftelevator3",
        model = -1240156945,
        coords = vector3(614.32, -9.41, 73.98),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_2ndelevleft1",
        door = "vinewood_PD_2ndelevleft2",
        model = -1240156945,
        coords = vector3(615.01, -9.66, 86.73),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_2ndelevleft2",
        door = "vinewood_PD_2ndelevleft1",
        model = -1240156945,
        coords = vector3(611.84, -8.02, 86.8),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_2ndelevright1",
        double = "vinewood_PD_2ndelevright2",      
        model = -1240156945,
        coords = vector3(609.76, -7.75, 86.73),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_2ndelevright2",
        double = "vinewood_PD_2ndelevright1",
        model = -1240156945,
        coords = vector3(608.34, -7.23, 86.73),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_roofelevatorleft1",
        double = "vinewood_PD_roofelevatorleft2",
        model = -1240156945,
        coords = vector3(603.69, -16.9, 100.34),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_roofelevatorleft2",
        double = "vinewood_PD_roofelevatorleft1",
        model = -1240156945,
        coords = vector3(602.28, -16.39, 100.34),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_roofelevatorright1",
        double = "vinewood_PD_roofelevatorright2",
        model = -1240156945,
        coords = vector3(599.4, -15.34, 100.34),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_roofelevatorright2",
        double = "vinewood_PD_roofelevatorright1",
        model = -1240156945,
        coords = vector3(597.99, -14.82, 100.34),
        autoRate = 6.0,
        locked = false,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_lobby1st",
        double = "vinewood_PD_lobby2nd",
        model = 904042749,
        coords = vector3(622.52, -0.5, 83.79),
        --autoRate = 6.0,
        locked = true,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

    {
        id = "vinewood_PD_lobby2nd",
        double = "vinewood_PD_lobby1st",
        model = 904042749,
        coords = vector3(620.1, 0.38, 83.79),
        --autoRate = 6.0,
        locked = true,
        holdOpen = true,
        restricted = {
            { type = 'job', job = 'police', workplace = false, gradeLevel = 0, jobPermission = false, reqDuty = false },
            { type = 'job', job = 'government', workplace = 'doj', gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'medical', workplace = false , gradeLevel = 10, jobPermission = false, reqDuty = true },
            { type = 'job', job = 'prison', workplace = 'corrections', gradeLevel = 30, jobPermission = false, reqDuty = true },
        },
    },

})