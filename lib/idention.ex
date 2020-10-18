defmodule Idention do

  def main(input) do
     input
     |> hash_input
     |> pick_color
     |> build_grid
     |> filter_odd_squares

  end
  def filter_odd_squares(%Idention.Image{grid: grid} = image) do 
    
    grid = Enum.filter grid, fn({code, _index}) ->
       rem(code, 2) == 0 

    end

    %Idention.Image{image | grid: grid}
  
  end
def pick_color( %Idention.Image{hex: [r,g,b | _tail]} = image) do 
  #this is the pattern maching
 #[r, g, b | _tail] = hex_list # we can do same pattern maching thing as above 

%Idention.Image{image | color: {r,g,b}}
  
end

def build_grid(%Idention.Image{hex: hex} = image) do

    grid = hex
    |> Enum.chunk(3)
    |> Enum.map(&mirror_row/1)
    |> List.flatten
    |> Enum.with_index

    %Idention.Image{image | grid: grid}
  
  end

def mirror_row(row) do
  [first, second | _tail] = row

  row ++ [second,first]

end


  def hash_input(input) do
    hex = :crypto.hash(:md5,input)
    |> :binary.bin_to_list 
    
    %Idention.Image{hex: hex}
  end
  
end
