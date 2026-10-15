"
I am the content of an empty square. I answer the same messages as a piece, so the game never has to check for nil.
"
Class {
	#name : 'MyNoPiece',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'testing' }
MyNoPiece >> isPiece [
	"No piece stands on the square"

	^ false
]

{ #category : 'moving' }
MyNoPiece >> moveIn: aGame to: aSquare [
	"An empty square has nothing to move"

	^ self
]

{ #category : 'rendering' }
MyNoPiece >> renderPieceOn: aSquare [
	"An empty square is drawn with its own letter"

	^ aSquare emptyLetter
]

{ #category : 'moves' }
MyNoPiece >> targetSquares [
	"An empty square has no moves"

	^ #()
]
