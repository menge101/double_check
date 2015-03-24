TASKS_TO_PROTECT ||=
TASKS_TO_PROTECT.each { |task| Rake::Task[task].enhance [:double_check] } if Rails.env.production?

task :double_check do
  DoubleCheck::double_check
end

