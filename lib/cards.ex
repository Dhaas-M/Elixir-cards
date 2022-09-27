defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def hello do
    :world
  end

  def create_deck do
    values = ["Ace","Two","Three","Four","Five"]
    suits = ["spades","diamond","hearts","clubs"]

    # Method 1
    # cards = for value <- values do
    #   for suit <- suits do 
    #     "#{value} of #{suit}"
    #   end
    # end
    # List.flatten(cards)

    # Method 2

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do 
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck,hand_size)
  end

  def save(deck, fileName) do 
    binary = :erlang.term_to_binary(deck)
    File.write(fileName, binary)
  end

  # def load(fileName) do 
  #   {status, binary} = File.read(fileName)

  #   case status do
  #     :ok -> :erlang.binary_to_term binary
  #     :error -> " file doesn't exist "
  #   end
    
  # end

  def load(fileName) do 
    
    case File.read(fileName) do
      {:ok, binary } -> :erlang.binary_to_term binary
      {:error, _reason} -> " file doesn't exist "
    end
    
  end

  def create_hand(hand_size) do
    # deck =  Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
