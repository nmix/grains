namespace :setup do
  desc 'Upload database.yml, master.key to server'
  task :upload_conf do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      upload! StringIO.new(File.read('config/database.yml')),
              "#{shared_path}/config/database.yml"
      upload! StringIO.new(File.read('config/master.key')),
              "#{shared_path}/config/master.key"
    end
  end
end
