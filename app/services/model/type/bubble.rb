class Model::Type::Bubble
  def initialize(model:, group_by:, y:, x:, begin_at: nil, end_at: nil)
    @model = model
    @group_by = group_by
    @y = y
    @x = x
    @begin_at = begin_at
    @end_at = end_at
  end

  private

  attr_reader :model, :group_by, :y, :x, :begin_at, :end_at

  def data
  end
end
