defmodule JaProfiler.SimpleDocument do

  defmodule SimpleSerializer do
    use JaSerializer
    
    attributes [:id, :int, :float, :binary]
  end

  defmodule SimpleModel do
    defstruct [
      id: 0,
      int: 10,
      float: 100.001,
      binary: "foo",
      atom: :bar,
      charlist: 'abcdef'
    ]
  end


  def profile(1) do
    Enum.each 0..10, fn(_) ->
      %{} = SimpleSerializer.format(%SimpleModel{}, %{}, [])
    end
  end

  def profile(n) do
    Enum.each 0..10, fn(_) ->
      %{} = (0..n)
            |> Enum.map(&(%SimpleModel{id: &1}))
            |> SimpleSerializer.format(%{}, [])
    end
  end
end
