class AddGenreToInterviewSheets < ActiveRecord::Migration[6.0]
  def change
    add_column :interview_sheets, :genre, :string
  end
end
