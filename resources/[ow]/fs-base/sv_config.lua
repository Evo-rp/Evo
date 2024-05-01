COMPONENTS.Config = {
	Discord = {
		Server = "",
	},
	Groups = {},
	Server = {
		ID = os.time(),
		Name = "Server Name",
		Access = GetConvar('sv_access_role', 0),
	}
}
