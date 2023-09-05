if @like.persisted?
  json.inserted_item render(partial: "posts/likes_partial", formats: :html, locals: { post: @post, like: @like })
  # json.form render(partial: "posts/post", formats: :html, locals: { post: @post } )
end
