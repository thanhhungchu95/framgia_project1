Kaminari.configure do |config|
  config.default_per_page = 10
  config.page_method_name = :paginer
  config.param_name = :page
  config.params_on_first_page = false
end
