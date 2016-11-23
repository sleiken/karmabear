SEED_FILES = Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort
SKIP_FILES = [/.*.rb/]

SEED_FILES.each do |seed|
  if !SKIP_FILES.any? { |re| re =~ seed }
    load seed
  end
end
