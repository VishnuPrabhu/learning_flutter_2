void main() {
  var deck = Deck();
  deck.shuffle();
  print(deck.cardsWithSuit('Diamonds'));
}

class Deck {
  var cards = <Card>[];

  Deck() {
    var ranks = ['Ace', 'Two', 'Three', 'Four', 'Five'];
    var suits = ['Diamonds', 'Hearts', 'Clubs', 'Spades'];

    for (var suit in suits) {
      for (var rank in ranks) {
        var card = Card(rank: rank, suit: suit);
        cards.add(card);
      }
    }
  }

  shuffle() {
    cards.shuffle();
  }

  cardsWithSuit(String suit) {
    return cards.where((card) => card.suit == suit);
  }

  deal(int handSize) {
    var hand = cards.sublist(0, handSize);
    cards = cards.sublist(handSize);

    return hand;
  }

  removeCard(String rank, String suit) {
    cards.removeWhere((card) => card.rank == rank && card.suit == suit);
  }

  @override
  String toString() {
    return cards.toString();
  }
}

class Card {
  String suit;
  String rank;

  Card({this.suit, this.rank});

  @override
  String toString() {
    return '$rank of $suit';
  }
}