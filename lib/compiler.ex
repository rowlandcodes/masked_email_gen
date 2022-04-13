defmodule Compiler do
  def compile() do
    compile_corpus(load_adjectives(), load_nouns())
  end

  def load_adjectives() do
    File.read!("corpus/adj.txt") |> String.split("\n")
  end

  def load_nouns() do
    File.read!("corpus/noun.txt") |> String.split("\n")
  end

  def compile_corpus(adjectives, nouns) do
    quoted = [
      quote do
        def adjectives() do
  unquote(Macro.escape(adjectives))
        end
      end,
      quote do
        def nouns() do
  unquote(Macro.escape(nouns))
        end
      end
    ]

    module = :"Elixir.Corpus"
    Module.create(module, quoted, Macro.Env.location(__ENV__))
    :code.purge(module)
  end
end
