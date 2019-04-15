# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here

#binding.pry

# pp @candidates
# pp experienced?(@candidates[1])
# pp find(4)
# pp days_ago?(@candidates[1])
# pp known_lang?(@candidates[4])
pp qualified_candidates(@candidates)

