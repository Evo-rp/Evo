_businessNotices = {}

_bizWizTypes = {
	default = {
		{
			id = "Dashboard",
			icon = { "fas", "house" },
			label = "Dashboard",
		},
		{
			id = "Search/Document",
			icon = { "fas", "file-lines" },
			label = "Documents",
			permission = "TABLET_VIEW_DOCUMENT",
		},
		{
			id = "View/Document",
			hidden = true,
		},
		{
			id = "View/Receipt",
			hidden = true,
		},

		{
			id = "Create/Document",
			hidden = true,
		},
		{
			id = "Create/Notice",
			hidden = true,
		},
		{
			id = "Create/Receipt",
			hidden = true,
		},
		{
			id = "Search/Receipt",
			icon = { "fas", "money-check-dollar" },
			label = "Receipts",
		},
		{
			id = "Search/ReceiptCount",
			icon = { "fas", "money-check-dollar" },
			label = "Receipts Count",
			permission = "TABLET_MANAGE_RECEIPT",
		},
		{
			id = "Tweet",
			icon = { "fab", "twitter" },
			label = "Business Twitter",
			permission = "TABLET_TWEET",
		},
		{
			id = "TweetSettings",
			icon = { "fab", "twitter" },
			label = "Twitter Profile",
			permission = "JOB_MANAGEMENT",
		},
	},
	mechanic = {
		{
			id = "Dashboard",
			icon = { "fas", "house" },
			label = "Dashboard",
		},
		{
			id = "Search/Document",
			icon = { "fas", "file-lines" },
			label = "Documents",
			permission = "TABLET_VIEW_DOCUMENT",
		},
		{
			id = "View/Document",
			hidden = true,
		},
		{
			id = "View/Receipt",
			hidden = true,
		},

		{
			id = "Create/Document",
			hidden = true,
		},
		{
			id = "Create/Notice",
			hidden = true,
		},
		{
			id = "Create/Receipt",
			hidden = true,
		},
		{
			id = "Search/Receipt",
			icon = { "fas", "money-check-dollar" },
			label = "Receipts",
		},
		{
			id = "Search/ReceiptCount",
			icon = { "fas", "money-check-dollar" },
			label = "Receipts Count",
			permission = "TABLET_MANAGE_RECEIPT",
		},
		{
			id = "Tweet",
			icon = { "fab", "twitter" },
			label = "Business Twitter",
			permission = "TABLET_TWEET",
		},
		{
			id = "TweetSettings",
			icon = { "fab", "twitter" },
			label = "Twitter Profile",
			permission = "JOB_MANAGEMENT",
		},
	},
	dealerships = {
		{
			id = "Dashboard",
			icon = { "fas", "house" },
			label = "Dashboard",
		},
		{
			id = "Search/Document",
			icon = { "fas", "file-lines" },
			label = "Documents",
			permission = "TABLET_VIEW_DOCUMENT",
		},
		{
			id = "View/Document",
			hidden = true,
		},
		{
			id = "View/Receipt",
			hidden = true,
		},
		{
			id = "Create/Receipt",
			hidden = true,
		},
		{
			id = "Create/Document",
			hidden = true,
		},
		{
			id = "Create/Notice",
			hidden = true,
		},
		{
			id = "PDM/Sales",
			icon = { "fas", "car" },
			label = "Vehicle Stock",
			permission = "dealership_sell",
		},
		{
			id = "PDM/Credit",
			icon = { "fas", "magnifying-glass-dollar" },
			label = "Run Credit Check",
			permission = "dealership_sell",
		},
		-- {
		-- 	name = 'pdm-licence-check',
		-- 	icon = {'fas', 'id-card'},
		-- 	label = 'Run License Check',
		-- 	path = '/business/search/documents',
		-- 	exact = true,
		-- 	permission = 'dealership_manage',
		-- },
		{
			id = "PDM/Manage",
			icon = { "fas", "list-check" },
			label = "Manage Dealership",
			permission = "dealership_manage",
		},
		{
			id = "PDM/SalesHistory",
			icon = { "fas", "clock-rotate-left" },
			label = "Sales History",
			permission = "dealership_manage",
		},
		{
			id = "Tweet",
			icon = { "fab", "twitter" },
			label = "Business Twitter",
			permission = "TABLET_TWEET",
		},
		{
			id = "TweetSettings",
			icon = { "fab", "twitter" },
			label = "Twitter Profile",
			permission = "JOB_MANAGEMENT",
		},
	},
	dealership_mechanic = {
		{
			id = "Dashboard",
			icon = { "fas", "house" },
			label = "Dashboard",
		},
		{
			id = "Search/Document",
			icon = { "fas", "file-lines" },
			label = "Documents",
			permission = "TABLET_VIEW_DOCUMENT",
		},
		{
			id = "View/Document",
			hidden = true,
		},
		{
			id = "View/Receipt",
			hidden = true,
		},

		{
			id = "Create/Document",
			hidden = true,
		},
		{
			id = "Create/Notice",
			hidden = true,
		},
		{
			id = "Search/Receipt",
			icon = { "fas", "money-check-dollar" },
			label = "Receipts",
		},
		{
			id = "Search/ReceiptCount",
			icon = { "fas", "money-check-dollar" },
			label = "Receipts Count",
			permission = "TABLET_MANAGE_RECEIPT",
		},
		{
			id = "PDM/Sales",
			icon = { "fas", "car" },
			label = "Vehicle Stock",
			permission = "dealership_sell",
		},
		{
			id = "PDM/Credit",
			icon = { "fas", "magnifying-glass-dollar" },
			label = "Run Credit Check",
			permission = "dealership_sell",
		},
		-- {
		-- 	name = 'pdm-licence-check',
		-- 	icon = {'fas', 'id-card'},
		-- 	label = 'Run License Check',
		-- 	path = '/business/search/documents',
		-- 	exact = true,
		-- 	permission = 'dealership_manage',
		-- },
		{
			id = "PDM/Manage",
			icon = { "fas", "list-check" },
			label = "Manage Dealership",
			permission = "dealership_manage",
		},
		{
			id = "PDM/SalesHistory",
			icon = { "fas", "clock-rotate-left" },
			label = "Sales History",
			permission = "dealership_manage",
		},
		{
			id = "Tweet",
			icon = { "fab", "twitter" },
			label = "Business Twitter",
			permission = "TABLET_TWEET",
		},
		{
			id = "TweetSettings",
			icon = { "fab", "twitter" },
			label = "Twitter Profile",
			permission = "JOB_MANAGEMENT",
		},
	},
	realestate = {
		{
			id = "Dashboard",
			icon = { "fas", "house" },
			label = "Dashboard",
		},
		{
			id = "Search/Document",
			icon = { "fas", "file-lines" },
			label = "Documents",
			permission = "TABLET_VIEW_DOCUMENT",
		},
		{
			id = "View/Document",
			hidden = true,
		},
		{
			id = "View/Receipt",
			hidden = true,
		},

		{
			id = "Create/Document",
			hidden = true,
		},
		{
			id = "Create/Notice",
			hidden = true,
		},
		{
			id = "Dynasty/Credit",
			icon = { "fas", "magnifying-glass-dollar" },
			label = "Run Credit Check",
			permission = "JOB_SELL",
		},
		{
			id = "Dynasty/Properties",
			icon = { "fas", "house-building" },
			label = "Properties",
			permission = "JOB_SELL",
		},
		{
			id = "Tweet",
			icon = { "fab", "twitter" },
			label = "Business Twitter",
			permission = "TABLET_TWEET",
		},
		{
			id = "TweetSettings",
			icon = { "fab", "twitter" },
			label = "Twitter Profile",
			permission = "JOB_MANAGEMENT",
		},
	},
	casino = {
		{
			id = "Dashboard",
			icon = { "fas", "house" },
			label = "Dashboard",
		},
		{
			id = "Search/Document",
			icon = { "fas", "file-lines" },
			label = "Documents",
			permission = "TABLET_VIEW_DOCUMENT",
		},
		{
			id = "View/Document",
			hidden = true,
		},
		{
			id = "View/Receipt",
			hidden = true,
		},

		{
			id = "Create/Document",
			hidden = true,
		},
		{
			id = "Create/Notice",
			hidden = true,
		},
		{
			id = "Create/Receipt",
			hidden = true,
		},
		{
			name = "Casino/BigWins",
			icon = { "fas", "cards" },
			label = "Big Wins",
			permission = "JOB_MANAGEMENT",
		},
		{
			id = "Tweet",
			icon = { "fab", "twitter" },
			label = "Business Twitter",
			permission = "TABLET_TWEET",
		},
		{
			id = "TweetSettings",
			icon = { "fab", "twitter" },
			label = "Twitter Profile",
			permission = "JOB_MANAGEMENT",
		},
	},
}

_bizWizConfig = {
	pdm = {
		logo = "https://lobfile.com/file/t6rNtAs2.webp",
		type = "dealerships",
	},
	tuna = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "dealership_mechanic",
	},
	hayes = {
		logo = "https://lobfile.com/file/Gyh6kPep.png",
		type = "mechanic",
	},
	dreamworks = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "mechanic",
	},
	realestate = {
		logo = "https://lobfile.com/file/4qAZumxW.png",
		type = "realestate",
	},
	autoexotics = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "mechanic",
	},
	ottos = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "mechanic",
	},
	bennys = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "mechanic",
	},
	harmony = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "mechanic",
	},
	casino = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "casino",
	},
	burgershot = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "default",
	},
	uwu = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "default",
	},
	demonetti_storage = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "default",
	},
	sagma = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "default",
	},
	pepega_pawn = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "default",
	},
	beanmachine = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "default",
	},
	gentry = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "default",
	},
	pipedowncigar = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "default",
	},
	tacoshop = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "default",
	},
	bluffs = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "default",
	},
	["bluffs_mechanic"] = {
		logo = "https://lobfile.com/file/WTk7W5Rp.png",
		type = "mechanic",
	},
}
