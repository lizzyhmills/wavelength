if @favourite_post.persisted?
  # json.form render(partial: "posts/post", formats: :html, locals: { post: @post } )
  json.delete_url post_favourite_posts_path(@post, @favourite_post)

end
