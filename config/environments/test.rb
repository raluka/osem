Osem::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Configure static asset server for tests with Cache-Control for performance
  # The configuration option `config.serve_static_assets` has been renamed to `config.serve_static_files` to clarify its
  # role (it merely enables serving everything in the `public` folder and is unrelated to the asset pipeline).
  # The `serve_static_assets` alias will be removed in Rails 5.0
  config.serve_static_files = true
  config.static_cache_control = 'public, max-age=3600'

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment
  config.action_controller.allow_forgery_protection    = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Print deprecation notices to the stderr
  config.active_support.deprecation = :stderr

  # Rails 4.2 introduced a new configuration option active_support.test_order for explicitly specifying test ordering.
  config.active_support.test_order = :sorted # or `:random` if you prefer

  # Set the detault url for action mailer
  config.action_mailer.default_url_options = { host: 'localhost:3000' }

  # Do not perform deliveries on test
  config.action_mailer.perform_deliveries = false

  config.after_initialize do
    ActiveRecord::Base.logger = nil
    # Set Time.now to May 1, 2014 00:01:00 AM (at this instant), but allow it to move forward
    t = Time.local(2014, 05, 01, 00, 01, 00)
    Timecop.travel(t)
  end

end
