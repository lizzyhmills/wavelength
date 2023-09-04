if @like.persisted?
  json.form render(partial: 'posts/post', formats: :html, locals: { post: @post })
  json.inserted_item render(partial: "posts/post", formats: :html, locals: { post: @post })
else
  # json.form render(partial: "posts/post", formats: :html, locals: { post: @post } )
end
