SEED_FILES = Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort
SKIP_FILES = Dir[File.join(Rails.root, 'db', 'seeds', 'test.rb')]

SEED_FILES.each do |seed|
  if !SKIP_FILES.include?(seed)
    load seed
  end
end
