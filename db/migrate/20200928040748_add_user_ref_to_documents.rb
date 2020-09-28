class AddUserRefToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_reference :documents, :user, foreign_key: true, default: User.first&.id
  end
end
