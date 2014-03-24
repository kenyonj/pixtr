class CommentActivity < Activity
  delegate :image, to: :subject
  delegate :name, to: :image, prefix: true
end
