defmodule JaProfiler do

  def compound_doc(n \\ 1) do
    JaProfiler.CompoundDocument.profile(n)
  end

  def simple_doc(n \\ 1) do
    JaProfiler.SimpleDocument.profile(n)
  end
end
