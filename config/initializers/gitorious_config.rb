GitoriousConfig = c = YAML::load_file(File.join(Rails.root,"config/gitorious.yml"))[RAILS_ENV]

VisibilityFeatureEnabled = (GitoriousConfig['visibility_feature_enabled'] != false)

# make the default be publicly open
GitoriousConfig['public_mode'] = true if GitoriousConfig['public_mode'].nil?
GitoriousConfig["locale"] = "en" if GitoriousConfig["locale"].nil?

# set global locale
I18n.default_locale = GitoriousConfig["locale"]
I18n.locale         = GitoriousConfig["locale"]
