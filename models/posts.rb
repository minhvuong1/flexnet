def add_new_post(description, image_url, user_id) 
    run_sql("
    INSERT INTO posts (description, image_url, user_id)
    VALUES ($1, $2, $3)", [description, image_url, user_id]
    )
end

def all_posts()
    run_sql('SELECT * FROM posts')
end