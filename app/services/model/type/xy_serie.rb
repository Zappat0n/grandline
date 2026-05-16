class Model::Type::XySerie
  def initialize(model:, y:, x:, begin_at: nil, end_at: nil)
    @model = model
    @y = y
    @x = x
    @begin_at = begin_at
    @end_at = end_at
  end

  def load_data
  end

  private

  attr_reader :model, :y, :x, :begin_at, :end_at

  def data
  end

  def client
    @client ||= Redis.new(url: ENV.fetch("REDIS_URL"))
  end
end
