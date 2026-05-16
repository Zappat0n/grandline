class Model::Type::Bubble < Model::Type::XySerie
  def serie
    {
      datasets: mapped_data
    }
  end

  def data
    model
      .data_points
      .select('COUNT(y) AS count, AVG(y) AS avg, STDDEV(y) as std_dev, JSON_EXTRACT(x, "$.category") AS category, JSON_EXTRACT(x, "$.location") AS location')
      .where('JSON_EXTRACT(x, "$.quote_unit") = "flat_rate"')
      .group(:category, :location)
      .having("count > 1")
  end

  def mapped_data
    data.map do |row|
      {
        label: row.category.strip.delete('"'),
        data: [
          {
            x: row.count,
            y: row.avg,
            r: Math.log2(row.std_dev)
          },
        backgroundColor: "%06x" % (rand * 0xffffff)
        ]
      }
    end
  end
end
