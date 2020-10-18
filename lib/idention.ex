defmodule Idention do

  def main(input) do
     input
     |> hash_input
     |> pick_color
  end
def pick_color(image) do 
  %Idention.Image{hex: [r,g,b | _tail]} = image #this is the pattern maching
 #[r, g, b | _tail] = hex_list # we can do same pattern maching thing as above 
 [r,g,b]
  
end

  def hash_input(input) do
    hex = :crypto.hash(:md5,input)
    |> :binary.bin_to_list 
    
    %Idention.Image{hex: hex}
  end
  
end
