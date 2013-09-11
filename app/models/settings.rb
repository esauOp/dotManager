class Settings < Settingslogic
  source "#{Rails.root}/config/dot_config.yml"
  namespace Rails.env
  load!
end