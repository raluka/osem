class AddSubjectAndCommentTemplateForEmailSettings < ActiveRecord::Migration
  def change
    add_column :email_settings, :comment_subject, :string
    add_column :email_settings, :comment_template, :text
    comment_subject = 'New comment has been posted for {eventtitle}'
    comment_template_text = %q(Dear {name},

User {comment_user} posted a new comment for event {eventtitle} of {conference} .

" {comment_body} "

To reply to this comment, please go to {comment_reply}

Best wishes,
{conference} Team
)
    EmailSettings.all.each do |email_setting|
      email_setting.comment_subject = comment_subject
      email_setting.comment_template = comment_template_text
      email_setting.save!
    end
  end
end
