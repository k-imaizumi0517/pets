json.text @comment.text
json.created_at simple_time(@comment.created_at)
json.user_id @comment.user.id
json.user_nickname @comment.user.nickname
