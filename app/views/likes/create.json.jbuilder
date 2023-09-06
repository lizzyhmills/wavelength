if @like.persisted?
  json.inserted_item @post.likes.count
  # json.form render(partial: "posts/post", formats: :html, locals: { post: @post } )
  json.delete_url post_like_path(@post, @like)

end
