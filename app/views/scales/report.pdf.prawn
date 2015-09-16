pdf.text "Escala de Permanência ao ETI - Periodo de: #{@scales_interval.count}", :size => 30, :style => :bold

pdf.move_down(30)

items = @scales_interval.map do |item|
  [
    item.stay.name,
    item.day_thread    
  ]
end

pdf.table items, :border_style => :grid,
  :row_colors => ["FFFFFF","DDDDDD"],
  :headers => ["Militar", "dia"],
  :align => { 0 => :left, 1 => :right, 2 => :right, 3 => :right }

pdf.move_down(10)

pdf.text "SISPERM - Sistema de Permanência", :size => 16, :style => :bold