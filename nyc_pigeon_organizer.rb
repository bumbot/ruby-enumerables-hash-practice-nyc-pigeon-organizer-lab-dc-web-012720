require 'pp'
require 'pry'

def nyc_pigeon_organizer(data)
  # write your code here!
  #
  # looks like:
  # pigeon = {
  #  :name = > {
  #    color[]
  #    :gender
  #    :lives
  #  },
  #  :name => {
  #    color[]
  #    :gender
  #    :lives
  #  }
  #
  #}
  #
  new_pigeon_data = get_names_and_genders(data)
  new_pigeon_data = get_attribute(new_pigeon_data, data, :color)
  new_pigeon_data = get_attribute(new_pigeon_data, data, :lives)
  
  new_pigeon_data
end

#
# helper functions
#
#

def get_names_and_genders(data)
  # returns a hash with names as keys and genders pre-populated
  name_hash = {}
  
  data.each_key do |key|
    if key == :gender
      data[key].each_key do |gender|
        i = 0
        
        while i < data[key][gender].length do
          name_hash["#{data[key][gender][i]}"] = {:color => [], :gender => [gender.to_s], :lives => []}
          i += 1
        end
      end
    end
  end
  
  name_hash
end

def get_attribute(nds, data, attribute)
  # updates nds with attribute from data
  data.each_key do |key|
    if key == attribute
      data[key].each_key do |att|
        i = 0
        
        while i < data[key][att].length do
          name = data[key][att][i]
          
          if nds[name]
            nds[name][attribute] << att.to_s
          end
          
          i += 1
        end
      end
      
      
    end
  end
  
  
  nds
end
