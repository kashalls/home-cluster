resource "authentik_stage_prompt_field" "username" {
  name                     = "username"
  field_key                = "username"
  required                 = true
  type                     = "text"
  label                    = "Username"
  initial_value            = <<-EOT
    try:
      return user.username
    except:
      return ''
  EOT
  placeholder              = "Username"
  initial_value_expression = true
  order                    = 200
}

resource "authentik_stage_prompt_field" "name" {
  name                     = "name"
  field_key                = "name"
  type                     = "text"
  required                 = true
  label                    = "Name"
  placeholder              = "Name"
  initial_value            = <<-EOT
    try:
      return user.name
    except:
      return ''
  EOT
  initial_value_expression = true
  order                    = 201
}

resource "authentik_stage_prompt_field" "email" {
  name                     = "email"
  field_key                = "email"
  type                     = "email"
  required                 = true
  label                    = "Email"
  placeholder              = "Email"
  initial_value            = <<-EOT
  try:
    return user.email
  except:
    return ''
  EOT
  initial_value_expression = true
  order                    = 202
}

resource "authentik_stage_prompt_field" "locale" {
  name                     = "locale"
  field_key                = "attributes.settings.locale"
  type                     = "ak-locale"
  required                 = true
  label                    = "Locale"
  placeholder              = "Locale"
  initial_value            = <<-EOT
  try:
    return user.attributes.get('settings', {}).get('locale', '')
  except:
    return ''
  EOT
  initial_value_expression = true
  order                    = 203
}

resource "authentik_stage_prompt_field" "password" {
  name          = "password"
  field_key     = "password"
  type          = "password"
  label         = "Password"
  placeholder   = "Password"
  initial_value = "Password"
  required      = true
  order         = 300
}

resource "authentik_stage_prompt_field" "password-repeat" {
  name          = "password-repeat"
  field_key     = "password-repeat"
  type          = "password"
  placeholder   = "Password (repeat)"
  label         = "Password (repeat)"
  initial_value = "Password (repeat)"
  required      = true
  order         = 301
}
