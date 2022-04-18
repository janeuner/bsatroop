## Category

resource discord_category_channel info_category {
  name = "Information"
  server_id = data.discord_server.server.id
  position = 0
}

## Channels

resource discord_text_channel welcome {
  name = "welcome"
  server_id = data.discord_server.server.id
  position = 0
  category = discord_category_channel.info_category.id
  sync_perms_with_category = false
}

resource discord_text_channel faq {
  name = "faq"
  server_id = data.discord_server.server.id
  position = 1
  category = discord_category_channel.info_category.id
}

resource discord_text_channel announcements {
  name = "announcements"
  server_id = data.discord_server.server.id
  position = 2
  category = discord_category_channel.info_category.id
  sync_perms_with_category = false
}

## Channel Permissions

// The info category is publicly visible
resource discord_channel_permission info_categoryrole_everyone {
  type = "role"
  channel_id = discord_category_channel.info_category.id
  overwrite_id = discord_role_everyone.everyone.id
  allow = data.discord_permission.observer.allow_bits
}

// The committee is reduced to observer rights on #welcome & #rules
resource discord_channel_permission info_categoryrole_committee {
  type = "role"
  channel_id = discord_category_channel.info_category.id
  overwrite_id = discord_role.committee.id
  allow = data.discord_permission.observer.allow_bits
  deny = data.discord_permission.moderator.allow_bits
}

// The committee role can create invites on the welcome channel
resource discord_channel_permission welcome_channelrole_committee {
  type = "role"
  channel_id = discord_text_channel.welcome.id
  overwrite_id = discord_role.committee.id
  allow = data.discord_permission.invite.allow_bits
  deny = data.discord_permission.moderator.allow_bits
}

// The committee role can moderate the announcements channel
resource discord_channel_permission announcements_channelrole_committee {
  type = "role"
  channel_id = discord_text_channel.announcements.id
  overwrite_id = discord_role.committee.id
  allow = data.discord_permission.moderator.allow_bits
}