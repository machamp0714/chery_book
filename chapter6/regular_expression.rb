text = <<TEXT
i love Ruby
Python is a grate language
Java and JavaScript is different
TEXT

p text.scan(/[A-Z][A-Za-z]+/)