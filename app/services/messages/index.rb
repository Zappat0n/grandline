class Messages::Index
  def initialize(user:)
    @user = user
  end

  def messages
    subquery = Message
                 .select("LEAST(user_id, receiver_id) AS user1, GREATEST(user_id, receiver_id) AS user2, MAX(id) AS max_id")
                 .where("user_id = :user_id OR receiver_id = :user_id", user_id: user.id)
                 .group("user1, user2")

    Message
      .joins("INNER JOIN (#{subquery.to_sql}) AS sub ON messages.id = sub.max_id")
      .includes(:user, :receiver)
  end

  private

  attr_reader :user
end
