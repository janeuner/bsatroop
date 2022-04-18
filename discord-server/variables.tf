variable discord_token {
  description   = "The token of the discord bot that will be accessing the API"
  type          = string
}

variable discord_server_id {
  description   = "The discord server id to search for"
  type          = string
}

variable discord_server_owner {
  description   = "Owner ID of the server (Setting this will transfer ownership)"
  type          = string
}

variable discord_server_region {
  description   = "Region of the server (e.g. us-west, us-central, us-east)"
  type          = string
  default       = "us-central"
}

variable discord_server_name {
  description   = "Name of the server (Friendly Name)"
  type          = string
  default       = "BSA Troop Server"
}
