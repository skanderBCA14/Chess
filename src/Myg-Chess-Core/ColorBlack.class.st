"
The black color. It knows how black pieces and dark squares are drawn.
"
Class {
	#name : 'ColorBlack',
	#superclass : 'Color',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
ColorBlack class >> default [
	"The black color of the chess game"

	^ self r: 0 g: 0 b: 0
]

{ #category : 'rendering' }
ColorBlack >> emptyLetter [
	"An empty dark square is drawn with x"

	^ 'x'
]

{ #category : 'rendering' }
ColorBlack >> letterOf: aPiece [
	"A black piece is drawn with its black letter"

	^ aPiece blackLetter
]

{ #category : 'rendering' }
ColorBlack >> write: aLetter [
	"A letter is written in lowercase on a dark square"

	^ aLetter asLowercase
]
