# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  # Task 3: Finding by :id
  # Define a method find that:
  # Takes in an id
  # Returns the candidate with that :id
  # If there is no candidate with that id, it naturally returns nil

    #ANSWER:
  # @candidates.select{|candidate| candidate[:id] == id}.first ## another option same results "select" returns an arr

  @candidates.find{|candidate| candidate[:id] == id}  ## "find" will only return ONE or the first it finds
end

def experienced?(candidate)
  # Task 2: Experienced Candidates
  # In the filters.rb file, define the method experienced? such that it:
  # Takes in a single candidate (hash). Note: not the array.
  # Returns true if the candidate has 2 years of experience or more
  # Returns false otherwise
    #ANSWER:
  candidate[:years_of_experience] >= 2
end

def qualified_candidates(candidates)
  # Task 4: "Qualified" Candidates
  # Define a method qualified_candidates in filters.rb that:
  # Takes in the collection of candidates
  # Returns a subset of the candidates that meet the following criteria:
  # Are experienced                 DONE
  # Have 100 or more Github points  DONE
  # Know at least Ruby or Python  Method**
  # Applied in the last 15 days   Method**
  # Are over the age of 17 (18+)    DONE
    #ANSWER:
  #below you are calling the F() 'experienced?' / the value of "[:github_points]" >= 100 /  f() known_lang? / F() days_ago?/ value of "candidate[:age]" >= 18
  candidates.select { |candidate| experienced?(candidate) && candidate[:github_points] >= 100 && known_lang?(candidate) && days_ago?(candidate) && candidate[:age] >= 18 }
end

# More methods will go below

def known_lang?(candidate)
   candidate[:languages].include?('Ruby') || candidate[:languages].include?('Javascript')  #"includes" this will check the arr "languages" and see if it included "whatever you give it"
end

def days_ago?(candidate)
 Date.today - candidate[:date_applied] <16
end

def ordered_by_qualifications(candidates)

candidates.sort { |fir, sec|
    if fir[:years_of_experience] == sec[:years_of_experience] then
      sec[:github_points] <=> fir[:github_points]
    else
      sec[:years_of_experience] <=> fir[:years_of_experience]
    end
   }

end

