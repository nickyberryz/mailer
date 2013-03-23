class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :roomname , :default => 0
      t.integer :amplifier, :default => 0
      t.integer :microphone, :default => 0
      t.integer :computer, :default => 0
      t.integer :overhead_projector, :default => 0
      t.integer :lcd_projector, :default => 0
      t.integer :television, :default => 0
      t.integer :voice_recorder, :default => 0
      t.integer :video_recorder, :default => 0
      t.integer :visualizer, :default => 0
      t.integer :loudspeaker, :default => 0
      t.timestamps
    end
  end
end

