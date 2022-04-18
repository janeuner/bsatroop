## Category

resource discord_category_channel admin_category {
  name = "Administration"
  server_id = data.discord_server.server.id
  position = 5
}

## Channels

resource discord_text_channel admin_only {
  name = "admin-only"
  server_id = data.discord_server.server.id
  position = 0
  category = discord_category_channel.admin_category.id
}

resource discord_text_channel admin_logs {
  name = "admin-logs"
  server_id = data.discord_server.server.id
  position = 1
  category = discord_category_channel.admin_category.id
}

## Channel Permissions

// The administration category is private
resource discord_channel_permission admin_categoryrole_everyone {
  type = "role"
  channel_id = discord_category_channel.admin_category.id
  overwrite_id = discord_role_everyone.everyone.id
  deny = data.discord_permission.hidden.deny_bits
}

// The admin role can chat in the administration category
resource discord_channel_permission admin_categoryrole_admin {
  type = "role"
  channel_id = discord_category_channel.admin_category.id
  overwrite_id = discord_role.admin.id
  allow = data.discord_permission.admin.allow_bits
}
