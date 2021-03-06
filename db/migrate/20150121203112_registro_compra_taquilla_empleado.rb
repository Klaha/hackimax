class RegistroCompraTaquillaEmpleado < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      # t.integer :movie_id, index:true
      t.references :movie, index: true
      t.time :time
      t.integer :theater_id, index:true
      t.date :date_show

      t.timestamps
    end

    create_table :theaters do |t|
      t.integer :theater_number
      t.string :type_theater

      t.timestamps
    end


    # create_table :transactions do |t|
    #   t.integer :user_id, index: true
    #   t.integer :show_id, index: true
    #   t.timestamps
    # end

    #add_foreign_key :articles, :authors

  end
end
