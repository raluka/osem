class AddSubjectAndCommentTemplateForEmailSettings < ActiveRecord::Migration
  def change
    comment_subject = 'New comment has been posted for {eventtitle}'
    comment_template_text = %q(Dear {name},

User {comment_user} posted a new comment for event {eventtitle} of {conference} .

" {comment_body} "

To reply to this comment, please go to {comment_reply}

Best wishes,
{conference} Team
)
    add_column :email_settings, :comment_subject, :string, default: comment_subject
    add_column :email_settings, :comment_template, :text, default: comment_template_text
  end
end
