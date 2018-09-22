if Rails.env.test?
  begin
    require 'rubocop/rake_task'

    RuboCop::RakeTask.new
  end

  begin
    desc 'Run rails_best_practices report'
    task :rails_best_practices do
      sh 'rails_best_practices --features --spec'
    end
  end

  begin
    require 'cucumber/rake/task'

    namespace :cucumber do
      Cucumber::Rake::Task.new(:all) do |t|
        t.cucumber_opts = %w[--format progress]
      end
    end
  end

  desc 'Run a build for continuous integration'
  task ci: [
    'log:clear',
    :rubocop,
    :rails_best_practices,
    :spec,
    'cucumber:all'
  ]
end
