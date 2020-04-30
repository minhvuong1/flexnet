def add_comment(comments, post_id, user_id)
    run_sql("INSERT INTO comments (comment, post_id, user_id)
    VALUES ($1, $2, $3);",[comments, post_id, user_id])
end

def all_comments() 
    run_sql("SELECT * FROM comments;")
end