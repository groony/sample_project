ActiveAdmin.register_page 'Sidekiq' do
  menu parent: 'Services', label: proc { t(:sidekiq) }

  content title: proc { t(:sidekiq) } do
    iframe src: '/admin/sidekiq_monitor', width: '100%', height: '1080px'
  end
end
