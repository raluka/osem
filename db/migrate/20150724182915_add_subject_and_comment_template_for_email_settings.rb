class AddSubjectAndCommentTemplateForEmailSettings < ActiveRecord::Migration
  def change
    add_column :email_settings, :comment_subject, :string
    add_column :email_settings, :comment_template, :text
    comment_subject = 'New comment has been posted for {eventtitle}'
    comment_template_text = 'Dear {name},\r\n\r\nUser {comment_user} posted a new comment for event {eventtitle}
                             of {conference} conference.\r\n\r\n{comment_body}\r\n\r\nTo reply to this comment, please
                             go to {comment_reply}\r\n\r\nBest wishes\r\n\r\n{conference} Team'
    EmailSettings.all.each do |email_setting|
      email_setting.comment_subject = comment_subject
      email_setting.comment_template = comment_template_text
      email_setting.save!
    end
  end
end
