data discord_color council {
    // gold
    hex = "#FFCC66"   
}

data discord_color parent {
    // green
    hex = "#469618"   
}

data discord_color scout {
    // tan
    hex = "#CC9900"   
}

data discord_color committee {
    // blue
    hex = "#4287f5"   
}

data discord_color admin {
    // scouting red
    hex = "#CE1126"   
}

resource discord_role_everyone everyone {
    server_id = discord_server.server.id
    permissions = data.discord_permission.observer.allow_bits
}

// role for admins
resource discord_role admin {
    server_id = discord_server.server.id
    name = "admin"
    color = data.discord_color.admin.dec
    permissions = data.discord_permission.admin.allow_bits
    hoist = false
    mentionable = true
    position = 1
}

// role for Boy Scouts
resource discord_role scout {
    server_id = discord_server.server.id
    name = "scout"
    color = data.discord_color.scout.dec
    permissions = data.discord_permission.observer.allow_bits
    hoist = true
    mentionable = true
    position = 2
}

// role for members of the Patrol Leader's council
resource discord_role council {
    server_id = discord_server.server.id
    name = "council"
    color = data.discord_color.council.dec
    permissions = data.discord_permission.observer.allow_bits
    hoist = true
    mentionable = true
    position = 3
}

// role for parents
resource discord_role parent {
    server_id = discord_server.server.id
    name = "parent"
    color = data.discord_color.parent.dec
    permissions = data.discord_permission.observer.allow_bits
    hoist = true
    mentionable = true
    position = 4
}

// role for Committee Members
resource discord_role committee {
    server_id = discord_server.server.id
    name = "committee"
    color = data.discord_color.committee.dec
    permissions = data.discord_permission.moderator.allow_bits
    hoist = true
    mentionable = true
    position = 5
}