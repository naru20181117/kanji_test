6.times do |n|
  Year.create!(
    id: n,
    year: n
  )
end

["赤", "青"].each do |x|
  Kanji.create!(
    kanji: x,
    year_id: 1
  )
end
