values = "('http://example.com/hfu2hiu3nkunkjniu4n3kjnjk'),
    ('http://example.com/jhfwnkjnui4y7hkjnfjknkjnfk'),
    ('http://example.com/uiejorunkuyengof68enf8oe'),
    ('http://example.com/ufopooppenfiienkf7890eh3');"

Url.transaction do
  Url.connection.execute "INSERT INTO urls (long_form) VALUES #{values}"
end