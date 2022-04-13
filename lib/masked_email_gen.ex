defmodule MaskedEmailGen do
  def masked_email() do
    adjectives = Corpus.adjectives()
    nouns = Corpus.nouns()

    adj = adjectives |> Enum.random
    noun = nouns |> Enum.random
    "#{adj}.#{noun}#{random_four_digit_string()}" 
  end

  def random_four_digit_string() do
    :rand.uniform(9999) |> Integer.to_string() |> String.pad_leading(4, "0")
  end

  def main(_) do
    IO.puts(masked_email())
  end
end
