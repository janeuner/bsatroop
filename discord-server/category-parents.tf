## Category

resource discord_category_channel parents_category {
  name = "Parents"
  server_id = data.discord_server.server.id
  position = 3
}

## Channels

resource discord_text_channel parents_info {
  name = "parents-info"
  server_id = data.discord_server.server.id
  position = 0
  category = discord_category_channel.parents_category.id
  sync_perms_with_category = false
}

resource discord_text_channel parents_only {
  name = "parents-only"
  server_id = data.discord_server.server.id
  #position = 1
  category = discord_category_channel.parents_category.id
  sync_perms_with_category = false
}

## Channel Permissions

// The parents category is private
resource discord_channel_permission parents_categoryrole_everyone {
  type = "role"
  channel_id = discord_category_channel.parents_category.id
  overwrite_id = discord_role_everyone.everyone.id
  deny = data.discord_permission.hidden.deny_bits
}

// The parents category is visible to parents
resource discord_channel_permission parents_categoryrole_parent {
  type = "role"
  channel_id = discord_category_channel.parents_category.id
  overwrite_id = discord_role.parent.id
  allow = data.discord_permission.visible.allow_bits
}

// The parents category is visible to committee
resource discord_channel_permission parents_categoryrole_committee {
  type = "role"
  channel_id = discord_category_channel.parents_category.id
  overwrite_id = discord_role.committee.id
  allow = data.discord_permission.visible.allow_bits
}

// The parent role can chat in #parents-only
resource discord_channel_permission parentonly_channelrole_parent {
  type = "role"
  channel_id = discord_text_channel.parents_only.id
  overwrite_id = discord_role.parent.id
  allow = data.discord_permission.member.allow_bits
}

// The committee role can moderate #parents-only
resource discord_channel_permission parentonly_channelrole_committee {
  type = "role"
  channel_id = discord_text_channel.parents_only.id
  overwrite_id = discord_role.committee.id
  allow = data.discord_permission.observer.allow_bits
}

// The parent role cannot modify #parents-info
resource discord_channel_permission parentsinfo_channelrole_parent {
  type = "role"
  channel_id = discord_text_channel.parents_info.id
  overwrite_id = discord_role.parent.id
  allow = data.discord_permission.observer.allow_bits
}

// The parent role cannot modify #parents-info
resource discord_channel_permission parentsinfo_channelrole_committee {
  type = "role"
  channel_id = discord_text_channel.parents_info.id
  overwrite_id = discord_role.committee.id
  allow = data.discord_permission.observer.allow_bits
  deny = data.discord_permission.moderator.allow_bits
}