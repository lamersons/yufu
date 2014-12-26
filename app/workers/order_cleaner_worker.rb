class OrderCleanerWorker
  include Sidekiq::Worker

  def perform
    Order::Base.where(state: 'new', owner: nil, :created_at.lte => (DateTime.now - 1.day)).destroy_all
  end
end
