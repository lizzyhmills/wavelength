if @comment.persisted?
  # json.form render(partial: "shared/comment", formats: :html, locals: { post: @post, comment: @comment })
  json.inserted_item render(partial: "shared/comment", formats: :html, locals: { post: @post, comment: @comment })
  # else
  # json.form render(partial: "shared/form", formats: :html, locals: { post: @post, comment: @comment })
end
