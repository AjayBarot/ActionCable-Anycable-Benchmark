# if defined?(Iodine)
#   Iodine.threads = ENV.fetch('RAILS_MAX_THREADS') { 5 } if Iodine.threads.zero?
#   Iodine.workers = ENV.fetch('WEB_CONCURRENCY') { 2 } if Iodine.workers.zero?
#   Iodine::DEFAULT_SETTINGS[:port] = ENV.fetch('PORT') { 3000 }
# end
